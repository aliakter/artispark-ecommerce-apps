import 'package:artispark/apps/data/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../data/data_source/remote_data_source.dart';
import '../../../data/error/exception.dart';
import '../models/challenge_product_model.dart';

abstract class ChallengeProductRepository {
  Future<Either<Failure, ChallengeProductModel>> getChallengeProduct(
      String token);

  Future<Either<Failure, String>> changeStatus(String token, dynamic data);
  Future<Either<Failure, String>> challengeUpload(
      String token, int id, dynamic data);
}

class ChallengeProductRepositoryImpl extends ChallengeProductRepository {
  final RemoteDataSource remoteDataSource;

  ChallengeProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ChallengeProductModel>> getChallengeProduct(
      String token) async {
    try {
      final result = await remoteDataSource.getChallengeProduct(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> changeStatus(
      String token, dynamic data) async {
    try {
      final result =
          await remoteDataSource.changeChallengeProductStatus(token, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> challengeUpload(
      String token, int id, data) async {
    try {
      final result = await remoteDataSource.challengeUpload(token, id, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
