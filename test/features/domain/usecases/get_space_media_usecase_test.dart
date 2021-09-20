import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_apod/core/errors/failures.dart';
import 'package:nasa_apod/features/domain/entities/space_media_entity.dart';
import 'package:nasa_apod/features/domain/repositories/space_media_repository.dart';
import 'package:nasa_apod/features/domain/usecases/get_space_media_usecase.dart';

import 'get_space_media_usecase_test.mocks.dart';

@GenerateMocks([SpaceMediaRepository, Failure])
void main() {
  late GetSpaceMediaUsecase usecase;
  late SpaceMediaRepository repository;

  const spaceMediaEntity = SpaceMediaEntity(
    description:
        "Fans of our fair planet might recognize the outlines of these cosmic clouds. On the left, bright emission outlined by dark, obscuring dust lanes seems to trace a continental shape, lending the popular name North America Nebula to the emission region cataloged as NGC 7000. To the right, just off the North America Nebula's east coast, is IC 5070, whose avian profile suggests the Pelican Nebula.  The two bright nebulae are about 1,500 light-years away, part of the same large and complex star forming region, almost as nearby as the better-known Orion Nebula. At that distance, the 3 degree wide field of view would span 80 light-years. This careful cosmic portrait uses narrow band images combined to highlight the bright ionization fronts and the characteristic glow from atomic hydrogen, sulfur, and oxygen gas. These nebulae can be seen with binoculars from a dark location.  Look northeast of bright star Deneb in the constellation Cygnus the Swan.",
    mediaType: "image",
    title: "North America and the Pelican",
    mediaUrl:
        "https://apod.nasa.gov/apod/image/2109/NGC7000_SHO_AndrewKlinger_res65_sig1024.jpg",
  );

  final date = DateTime(2021, 09, 16);

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUsecase(repository);
  });

  // When getSpaceMedia() is called from the repository, the expected response is a SpaceMediaEntity on the RHS (success - right hand side)
  test(
    'this method should get a space media for a given date from the repository',
    () async {
      // Arrange
      when(repository.getSpaceMedia(date)).thenAnswer(
          (_) async => const Left<SpaceMediaEntity, Failure>(spaceMediaEntity));

      // Act
      final response = await usecase(date);

      // Assert
      expect(
        response,
        const Left<SpaceMediaEntity, Failure>(spaceMediaEntity),
      );
      verify(repository.getSpaceMedia(date)).called(1);
    },
  );
}
