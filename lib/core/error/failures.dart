import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

///// offline failure
class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

///// server failure
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

///// empty cache failure
class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
