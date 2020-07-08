import 'package:photo_gallery/core/resources/error.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/camera/domain/entities/image.dart';
import 'package:photo_gallery/features/camera/domain/repositories/camera_repository.dart';

class GetImage extends UseCase<Image, NoParams> {
  final CameraRepository repository;

  GetImage(this.repository);

  @override
  Future<Either<Failure, Image>> call(NoParams params) async {
    return await repository.getImage();
  }

}