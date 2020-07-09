import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';

abstract class GalleryRepository {
  Future<Either<Failure, List<Image>>> getImages();
}