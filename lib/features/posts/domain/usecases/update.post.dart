import 'package:blog_app_tdd/core/error/failures.dart';
import 'package:blog_app_tdd/features/posts/domain/entities/post.dart';
import 'package:blog_app_tdd/features/posts/domain/repositories/posts.repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
