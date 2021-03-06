import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';
import 'package:photo_gallery/core/resources/strings.dart';
import 'package:photo_gallery/features/gallery/presentation/widgets/display_grid.dart';
import 'package:photo_gallery/features/image/presentation/pages/main_camera.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart'
    as imageEntity;

import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';

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
    return Scaffold(
      body: BlocListener<ImageBloc, ImageState>(
        listener: (BuildContext context, ImageState state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.toString()),
              ),
            );
          }
        },
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is Loading) {
              return Stack(
                children: <Widget>[
                  _buildPage(context, null),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings.welcome_message,
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
                      Strings.subtitle_message,
                      style: TextStyle(
                        fontSize: Dimensions.getTextSize(context, 14),
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          imageList != null
              ? imageList.isNotEmpty
                  ? DisplayGrid(
                      imageList: imageList,
                    )
                  : Container(
                      height: Dimensions.getConvertedHeightSize(400, context),
                      alignment: Alignment.center,
                      padding: Dimensions.getEdgeInsetsAll(context, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Strings.no_data_message,
                            width:
                                Dimensions.getConvertedWidthSize(200, context),
                          ),
                          Container(
                            padding: Dimensions.getEdgeInsetsAll(context, 20),
                            child: Text(
                              Strings.error_data_message,
                              style: TextStyle(
                                fontSize: Dimensions.getTextSize(context, 14),
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
              : Center(
                  child: Container(
                    padding: Dimensions.getEdgeInsetsAll(context, 20),
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.camera,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => TakePictureScreen(
                camera: widget.camera,
              ),
            ),
          );
        },
      ),
    );
  }
}
