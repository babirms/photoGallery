import 'package:photo_gallery/core/resources/error.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/gallery/domain/entities/gallery.dart';
import 'package:photo_gallery/features/gallery/domain/repositories/gallery_repository.dart';

class GetImages extends UseCase<Gallery, NoParams> {
  final GalleryRepository repository;

  GetImages(this.repository);

  @override
  Future<Either<Failure, Gallery>> call(NoParams params) async {
    return await repository.getImages();
  }
}
