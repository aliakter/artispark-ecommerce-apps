import 'package:artispark/apps/data/error/exception.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../data/data_source/remote_data_source.dart';

abstract class ProfileUpdateRepository {
  Future<Either<Failure, String>> editProfile(String token, dynamic body);
  Future<Either<Failure, String>> changePassword(String token, dynamic data);
  Future<Either<Failure, String>> deleteAccount(String token);
}

class ProfileUpdateRepositoryImpl extends ProfileUpdateRepository {
  final RemoteDataSource remoteDataSource;
  ProfileUpdateRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> editProfile(
      String token, dynamic data) async {
    try {
      final result = await remoteDataSource.updateProfile(token, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(String token, data) async {
    try {
      final result = await remoteDataSource.changePassword(token, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAccount(String token) async {
    try {
      final result = await remoteDataSource.deleteAccount(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
