import 'package:blog_app_tdd/features/posts/data/models/post.model.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocalDatasource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachedPosts(List<PostModel> postsModels);
}

class PostLocalDataSourceImpl implements PostLocalDatasource {
  @override
  Future<Unit> cachedPosts(List<PostModel> postsModels) {
    // TODO: implement cachedPosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}
