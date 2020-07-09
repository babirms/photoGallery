import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:photo_gallery/features/image/presentation/pages/main_camera.dart';

class GalleryScreen extends StatefulWidget {
   final camera;

  const GalleryScreen({Key key, @required this.camera}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GalleryScreenState();
  }

}

class _GalleryScreenState extends State<GalleryScreen>{
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Essa é a galeria principal'),
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