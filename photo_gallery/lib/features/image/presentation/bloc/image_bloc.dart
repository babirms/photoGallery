import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/gallery/presentation/bloc/bloc.dart'
    as galleryBloc;
import 'package:photo_gallery/features/image/domain/usecases/save_image.dart';
import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';
import 'package:meta/meta.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final SaveImage saveImage;

  ImageBloc({@required this.saveImage}) : super(Empty()) {
    // add(GetImageEvent());
  }
  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is SaveImageEvent) {
      yield Loading();
      final failureOrBool = await saveImage(Params(image: event.image));
      yield* _eitherLoadedOrErrorState(failureOrBool);
    }
  }

  Stream<ImageState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrBool,
  ) async* {
    yield failureOrBool.fold((failure) {
      return Error(failure: failure);
    }, (result) {
      if (result) {
        
        return Loaded();
      } else
        return Error(failure: ServerFailure());
    });
  }
}
