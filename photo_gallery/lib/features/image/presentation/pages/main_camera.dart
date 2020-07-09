import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';
import 'package:photo_gallery/features/image/presentation/pages/confirm_image.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        elevation: 3,
        title: Text(
          "Tire sua foto".toUpperCase(),
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 18),
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(102, 102, 102, 1),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(Icons.camera_alt, color: Colors.purple,),
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final path = join(
                (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
              );
              await _controller.takePicture(path);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ConfirmImageScreen(imagePath: path),
                ),
              );
            } catch (e) {
              print(e);
            }
          }),
    );
  }
}
