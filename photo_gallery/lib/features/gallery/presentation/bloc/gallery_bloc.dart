import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:photo_gallery/features/gallery/presentation/bloc/bloc.dart';


class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitial());

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
