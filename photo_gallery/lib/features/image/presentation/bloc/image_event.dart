import 'package:equatable/equatable.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();
  @override
  List<Object> get props => [];
}

class SaveImageEvent extends ImageEvent {
  final Image image;

  SaveImageEvent({@required this.image});

  @override
  List<Object> get props => [image];
}

class GetImagesEvent extends ImageEvent {
  GetImagesEvent();
}
