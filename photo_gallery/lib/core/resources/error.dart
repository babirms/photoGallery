import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  Failure([this.properties = const <dynamic>[]]);
  List<Object> get props => properties;
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}