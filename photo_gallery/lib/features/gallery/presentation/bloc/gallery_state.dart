import 'package:equatable/equatable.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
  @override
  List<Object> get props => [];
}

class Empty extends GalleryState {}

class Loading extends GalleryState {}

class Loaded extends GalleryState {
  final List<Image> imagesList;

  Loaded({@required this.imagesList});

  @override
  List<Object> get props => [imagesList];
}

class Error extends GalleryState {
  final Failure failure;

  Error({@required this.failure});
  @override
  List<Object> get props => [failure];
}
