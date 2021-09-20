import 'package:either_dart/either.dart';
import 'package:nasa_apod/core/errors/failures.dart';
import 'package:nasa_apod/features/domain/entities/space_media_entity.dart';

abstract class SpaceMediaRepository {
  Future<Either<SpaceMediaEntity, Failure>> getSpaceMedia(DateTime date);
}
