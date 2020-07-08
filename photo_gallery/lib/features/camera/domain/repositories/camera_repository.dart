import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/camera/domain/entities/image.dart';

abstract class CameraRepository {
  Future<Either<Failure, bool>> saveImage(Image image);
  Future<Either<Failure, Image>> getImage();

}