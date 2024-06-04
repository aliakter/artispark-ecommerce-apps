import 'dart:io';

import 'package:artispark/apps/data/data_source/local_data_source.dart';
import 'package:artispark/apps/data/data_source/remote_data_source.dart';
import 'package:artispark/apps/data/error/exception.dart';
import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/views/artist/model/artist_model.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/order/model/order_model.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData(String token);
  Future<Either<Failure, List<CityModel>>> getCityData();

  Future<Either<Failure, List<StoryModel>>> getAllStory(String token);

  Future<Either<Failure, List<ArtistsModel>>> getAllArtistList(String token);

  Future<Either<Failure, List<OrderModel>>> getAllOrder(String token);

  Future<Either<Failure, List<dynamic>>> getCollaborateData(String token);

  Future<Either<Failure, StoryModel>> getStoryDetails(String token, String id);

  Future<Either<Failure, String>> setUnsetWishlist(String token, String id);

  // Future<Either<Failure, String>> createStoryData(String token, String title,
  //     File storyImage, String description, String path);

  // Future<Either<Failure, String>> editStoryData(String token, String id,
  //     String title, File storyImage, String description, String path);
}

class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, HomeModel>> getHomeData(String token) async {
    try {
      final result = await remoteDataSource.getHomeData(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

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
  Future<Either<Failure, List<ArtistsModel>>> getAllArtistList(
      String token) async {
    try {
      final result = await remoteDataSource.getAllArtistList(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getAllOrder(String token) async {
    try {
      final result = await remoteDataSource.getAllOrder(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getCollaborateData(
      String token) async {
    try {
      final result = await remoteDataSource.getCollaborateData(token);
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

  @override
  Future<Either<Failure, String>> setUnsetWishlist(
      String token, String id) async {
    try {
      final result = await remoteDataSource.setUnsetWishlist(token, id);
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

  // @override
  // Future<Either<Failure, String>> editStoryData(String token, String id,
  //     String title, File storyImage, String description, String path) async {
  //   try {
  //     final result = await remoteDataSource.editStoryData(
  //         token, id, title, storyImage, description, path);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   }
  // }

  @override
  Future<Either<Failure, List<CityModel>>> getCityData() async {
    try {
      final result = await remoteDataSource.getCityData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
