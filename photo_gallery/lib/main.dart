import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ],
      child: MaterialApp(
        title: 'Simple Gallery',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) =>
              MyHomePage(title: 'Simple Gallery', camera: firstCamera),
          '/camera': (BuildContext context) => TakePictureScreen(
                camera: firstCamera,
              ),
        },
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.camera}) : super(key: key);
  final String title;
  final camera;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clique para tirar uma foto',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TakePictureScreen(
                camera: widget.camera,
              ),
            ),
          );
        },
        tooltip: 'camera',
        child: Icon(Icons.camera),
      ),
    );
  }
}
