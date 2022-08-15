import 'package:blog_app_tdd/core/error/failures.dart';
import 'package:blog_app_tdd/features/posts/domain/entities/post.dart';
import 'package:blog_app_tdd/features/posts/domain/repositories/posts.repository.dart';
import 'package:dartz/dartz.dart';

class GettAllPostsUseCase {
  final PostsRepository repository;

  GettAllPostsUseCase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
