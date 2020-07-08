import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/features/camera/presentation/pages/main_camera.dart';

void main() async {
  // plugin inicializado antes do runapp
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(title: 'Simple Gallery'),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => MyHomePage(title: 'Simple Gallery', camera: firstCamera),
          '/camera': (BuildContext context) => TakePictureScreen(
                camera: firstCamera,
              ),
        }),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
        child: Icon(Icons.add),
      ),
    );
  }
}
