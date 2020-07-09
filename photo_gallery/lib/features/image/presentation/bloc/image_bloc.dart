import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/image/domain/usecases/save_image.dart';

import 'package:photo_gallery/features/image/domain/usecases/get_images.dart';
import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:meta/meta.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final SaveImage saveImage;
  final GetImages getImages;

  ImageBloc({
    @required this.saveImage,
    @required this.getImages,
  }) : super(Empty()) {
    add(GetImagesEvent());
  }
  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is SaveImageEvent) {
      yield Loading();
      final failureOrBool = await saveImage(Params(image: event.image));
      yield* _eitherLoadedOrErrorState(failureOrBool);
    } else if (event is GetImagesEvent) {
      var failureOrData = await getImages(NoParams());
      yield failureOrData.fold((failure) {
        return Error(failure: failure);
      }, (data) {
        return Loaded(imagesList: data);
      });
    }
  }

  Stream<ImageState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrBool,
  ) async* {
    yield failureOrBool.fold((failure) {
      return Error(failure: failure);
    }, (result) {
      this.add(GetImagesEvent());
      if (result) {
        return Loaded();
      }
    });
  }
}
