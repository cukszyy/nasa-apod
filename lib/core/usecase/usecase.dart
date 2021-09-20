import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_apod/core/errors/failures.dart';

abstract class Usecase<Input, Output> {
  Future<Either<Output, Failure>> call(Input params);
}
