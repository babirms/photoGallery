import 'package:photo_gallery/core/resources/error.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';

class GetImages extends UseCase<List<Image>, NoParams> {
  final GalleryRepository repository;

  GetImages(this.repository);

  @override
  Future<Either<Failure, List<Image>>> call(NoParams params) async {
    return await repository.getImages();
  }
}
