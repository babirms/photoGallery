import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/gallery/domain/entities/gallery.dart';

abstract class GalleryRepository {
  Future<Either<Failure, Gallery>> getImages();
}
