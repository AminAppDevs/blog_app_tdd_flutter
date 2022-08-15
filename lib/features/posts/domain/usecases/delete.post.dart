import 'package:blog_app_tdd/core/error/failures.dart';
import 'package:blog_app_tdd/features/posts/domain/repositories/posts.repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
