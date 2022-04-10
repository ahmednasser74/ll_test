import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure() : super(message: 'Server Failure');

}

class CacheFailure extends Failure {
  CacheFailure() : super(message: 'Cache Failure');

}
