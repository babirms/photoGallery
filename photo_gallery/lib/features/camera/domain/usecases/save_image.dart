import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/camera/domain/entities/image.dart';
import 'package:photo_gallery/features/camera/domain/repositories/image_repository.dart';

class SaveImage extends UseCase<bool, Params> {
  final ImageRepository repository;

  SaveImage(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.saveImage(params.image);
  }
  
} 

class Params extends Equatable {
  final Image image;

  Params(this.image);

  @override
  List<Object> get props => [image];

}