import 'package:artispark/apps/data/data_source/remote_data_source.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/views/compare/model/compare_list_model.dart';
import 'package:artispark/apps/views/favourite/model/favourite_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class CompareRepository {
  Future<Either<Failure, CompareListModel>> getCompareList(Map<String, dynamic> data);
  Future<Either<Failure, FavouriteModel>> getFavouriteList(String token);
}

class CompareRepositoryImpl extends CompareRepository {
  final RemoteDataSource remoteDataSource;
  CompareRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CompareListModel>> getCompareList(Map<String, dynamic>  data) async {
    try {
      final result = await remoteDataSource.getCompareListData(data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, FavouriteModel>> getFavouriteList(String token) async {
    try {
      final result = await remoteDataSource.getFavouriteList(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
