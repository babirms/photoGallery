import 'package:equatable/equatable.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

abstract class ImageState extends Equatable {
  const ImageState();
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class Empty extends ImageState {}

class Loading extends ImageState {}

class Loaded extends ImageState {
  final List<Image> imagesList;

  Loaded({ @required this.imagesList});

  @override
  List<Object> get props => [imagesList];

}

class Error extends ImageState {
  final Failure failure;

  Error({@required this.failure});
  @override
  List<Object> get props => [failure];
}
