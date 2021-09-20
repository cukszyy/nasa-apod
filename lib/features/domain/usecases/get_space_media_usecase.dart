import 'package:nasa_apod/core/errors/failures.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:nasa_apod/core/usecase/usecase.dart';
import 'package:nasa_apod/features/domain/entities/space_media_entity.dart';
import 'package:nasa_apod/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaUsecase implements Usecase<DateTime, SpaceMediaEntity> {
  final SpaceMediaRepository repository;

  GetSpaceMediaUsecase(this.repository);

  @override
  Future<Either<SpaceMediaEntity, Failure>> call(DateTime date) async {
    return await repository.getSpaceMedia(date);
  }
}
