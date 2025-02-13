import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class RegistrationFailure extends Failure {
  const RegistrationFailure(super.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure(String errorMessage) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
