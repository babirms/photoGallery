import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:photo_gallery/features/gallery/domain/usecases/get_images.dart';
import 'package:photo_gallery/features/gallery/presentation/bloc/bloc.dart';
import 'package:meta/meta.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetImages getImages;

  GalleryBloc({@required this.getImages}) : super(Empty());

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
