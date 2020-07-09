import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';

abstract class ImageRepository {
  Future<Either<Failure, bool>> saveImage(Image image);
  Future<Either<Failure, List<Image>>> getImages();
}
