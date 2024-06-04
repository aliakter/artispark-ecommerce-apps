import 'dart:io';

import 'package:artispark/apps/data/data_source/local_data_source.dart';
import 'package:artispark/apps/data/data_source/remote_data_source.dart';
import 'package:artispark/apps/data/error/exception.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:dartz/dartz.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryModel>>> getAllStory(String token);

  Future<Either<Failure, StoryModel>> getStoryDetails(String token, String id);

  // Future<Either<Failure, String>> createStoryData(String token, String title,
  //     File storyImage, String description, String path);

  Future<Either<Failure, String>> editStoryData(String token, String id, Map<String, dynamic> body);

  Future<Either<Failure, String>> deleteStoryData(String token, String id);
}

class StoryRepositoryImpl extends StoryRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  StoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<StoryModel>>> getAllStory(String token) async {
    try {
      final result = await remoteDataSource.getAllStory(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, StoryModel>> getStoryDetails(
      String token, String id) async {
    try {
      final result = await remoteDataSource.getStoryDetails(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  // @override
  // Future<Either<Failure, String>> createStoryData(String token, String title,
  //     File storyImage, String description, String path) async {
  //   try {
  //     final result = await remoteDataSource.createStory(
  //         token, title, storyImage, description, path);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   }
  // }

  @override
  Future<Either<Failure, String>> editStoryData(String token, String id, Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.editStoryData(token, id, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> deleteStoryData(
      String token, String id) async {
    try {
      final result = await remoteDataSource.deleteStoryData(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
