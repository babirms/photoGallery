import 'package:equatable/equatable.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
  @override
  List<Object> get props => [];
}

class GetGallery extends GalleryEvent {
  final List<Image> imageGallery;

  GetGallery({@required this.imageGallery});

  @override
  List<Object> get props => [imageGallery];
}
