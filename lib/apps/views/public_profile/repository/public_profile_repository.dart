import 'package:artispark/apps/data/data_source/remote_data_source.dart';
import 'package:artispark/apps/data/error/exception.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/views/public_profile/model/public_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class PublicProfileRepository {
  Future<Either<Failure, PublicProfileModel>> getPublicShop(
      String token, String username);
  Future<Either<Failure, String>> setRating(
      String token, String username, dynamic data);
}

class PublicProfileRepositoryImpl extends PublicProfileRepository {
  final RemoteDataSource remoteDataSource;
  PublicProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, PublicProfileModel>> getPublicShop(
      String token, String username) async {
    try {
      final result = await remoteDataSource.getPublicShop(token, username);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> setRating(
      String token, String username, dynamic data) async {
    try {
      final result = await remoteDataSource.setReview(token, username, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
