import 'package:blog_app_tdd/core/error/exceptions.dart';
import 'package:blog_app_tdd/core/network/network.info.dart';
import 'package:blog_app_tdd/features/posts/data/datasource/post.local.data.source.dart';
import 'package:blog_app_tdd/features/posts/data/datasource/post.remote.datasource.dart';
import 'package:blog_app_tdd/features/posts/data/models/post.model.dart';
import 'package:blog_app_tdd/features/posts/domain/entities/post.dart';
import 'package:blog_app_tdd/core/error/failures.dart';
import 'package:blog_app_tdd/features/posts/domain/repositories/posts.repository.dart';
import 'package:dartz/dartz.dart';

class PostReopsitoryImp implements PostsRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDatasource postLocalDataSource;
  final NetworkInfo networkInfo;

  PostReopsitoryImp({
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await postRemoteDataSource.GetAllPosts();
        postLocalDataSource.cachedPosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await postLocalDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.addPost(postModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.updatePost(postModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.deletePost(id);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
