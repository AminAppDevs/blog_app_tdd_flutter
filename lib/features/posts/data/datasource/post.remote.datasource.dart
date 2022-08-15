import 'package:blog_app_tdd/features/posts/data/models/post.model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> GetAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> GetAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPost(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    throw UnimplementedError();
  }
}
