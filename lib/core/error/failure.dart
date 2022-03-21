import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final dynamic error;

  const Failure(this.error);

  @override
  List<Object?> get props => [error];
}
