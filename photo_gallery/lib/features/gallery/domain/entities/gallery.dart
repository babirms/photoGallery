import 'package:equatable/equatable.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

class Gallery extends Equatable {
  final List<Image> imagesList;

  Gallery({@required this.imagesList});

  @override
  List<Object> get props => [imagesList];
}
