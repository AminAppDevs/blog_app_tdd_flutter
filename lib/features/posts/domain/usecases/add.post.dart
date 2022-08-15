import 'package:blog_app_tdd/core/error/failures.dart';
import 'package:blog_app_tdd/features/posts/domain/entities/post.dart';
import 'package:blog_app_tdd/features/posts/domain/repositories/posts.repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUseCase {
  final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
