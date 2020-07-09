import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';
import 'package:photo_gallery/features/gallery/presentation/bloc/bloc.dart';
import 'package:photo_gallery/features/gallery/presentation/widgets/display_grid.dart';
import 'package:photo_gallery/features/image/presentation/pages/main_camera.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart'
    as imageEntity;

class GalleryScreen extends StatefulWidget {
  final camera;

  const GalleryScreen({Key key, @required this.camera}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GalleryScreenState();
  }
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<GalleryBloc, GalleryState>(
        listener: (BuildContext context, GalleryState state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.toString()),
              ),
            );
          }
        },
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            if (state is Loading) {
              return Stack(
                children: <Widget>[
                  _buildPage(context, null),
                  // LoadingWidget(),
                ],
              );
            } else if (state is Loaded) {
              return _buildPage(context, state.imagesList);
            } else {
              return _buildPage(context, null);
            }
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, List<imageEntity.Image> imageList) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: Dimensions.getConvertedHeightSize(50, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bem-Vindo",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 32),
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(82, 82, 82, 1),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getConvertedHeightSize(1, context),
                    ),
                    Text(
                      "Navegue pelas fotos da galeria",
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 14),
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          imageList != null
              ? imageList.isNotEmpty
                  ? DisplayGrid(
                      imageList: imageList,
                    )
                  : Container(child: Text('Não existem dados.'))
              : Container(
                  child: Text("Aguarde..."),
                ),
          Container(
            width: double.infinity,
            padding: Dimensions.getEdgeInsetsAll(context, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)],
            ),
            child: RaisedButton(
              padding: Dimensions.getEdgeInsetsAll(context, 5),
              
              color: Colors.purple,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text('Tire uma foto', style: TextStyle(color: Colors.white)),
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(
                      camera: widget.camera,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
