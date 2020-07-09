import 'package:photo_gallery/core/resources/error.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:photo_gallery/features/image/domain/repositories/image_repository.dart';

class GetImage extends UseCase<List<Image>, NoParams> {
  final ImageRepository repository;

  GetImage(this.repository);

  @override
  Future<Either<Failure, List<Image>>> call(NoParams params) async {
    return await repository.getImages();
  }
}
