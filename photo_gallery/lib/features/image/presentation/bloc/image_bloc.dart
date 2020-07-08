import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/core/resources/usecase.dart';
import 'package:photo_gallery/features/image/domain/usecases/get_image.dart';
import 'package:photo_gallery/features/image/domain/usecases/save_image.dart';
import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';
import 'package:meta/meta.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final GetImage getImage;
  final SaveImage saveImage;

  ImageBloc({@required this.getImage, @required this.saveImage})
      : super(Empty());

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is SaveImageEvent) {
      yield Loading();
      final failureOrBool =  await saveImage(Params(image: event.image));
      yield* _eitherLoadedOrErrorState(failureOrBool);
    } else if (event is GetImageEvent) {
      yield Loading();
      final failureOrData = await getImage(NoParams());
      yield failureOrData.fold((failure) {
        return Error(failure: failure);
      }, (data) {
        return Loaded();
      });
    }
  }

  Stream<ImageState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrBool,
  ) async* {
    yield failureOrBool.fold((failure) {
      return Error(failure: failure);
    }, (result) {
      if (result)
        return Loaded();
      else
        return Error(failure: ServerFailure());
    });
  }
}
