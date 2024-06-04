import 'package:artispark/apps/data/data_source/remote_data_source.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/views/chat_details/model/chat_details_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class ChatDetailsRepository {
  Future<Either<Failure, ChatDetailsModel>> getChatDetails(
      String token, String user);
  Future<Either<Failure, String>> sendMessage(
      String token, String user, dynamic data);
}

class ChatDetailsRepositoryImpl extends ChatDetailsRepository {
  RemoteDataSource remoteDataSource;

  ChatDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ChatDetailsModel>> getChatDetails(
      String token, String user) async {
    try {
      final result = await remoteDataSource.getChatDetails(token, user);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> sendMessage(
      String token, String user, dynamic data) async {
    try {
      final result = await remoteDataSource.sendMessage(token, user, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
