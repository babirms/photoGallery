import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/features/gallery/presentation/bloc/bloc.dart';
import 'package:photo_gallery/features/gallery/presentation/pages/gallery_screen.dart';
import 'package:photo_gallery/features/image/presentation/bloc/image_bloc.dart';
import 'package:photo_gallery/features/image/presentation/pages/main_camera.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  await ic.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (_) => ic.sl<ImageBloc>(),
        ),
        BlocProvider<GalleryBloc>(
          create: (_) => ic.sl<GalleryBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Simple Gallery',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => GalleryScreen(camera: firstCamera),
          '/camera': (BuildContext context) => TakePictureScreen(
                camera: firstCamera,
              ),
        },
      ),
    ),
  );

}
