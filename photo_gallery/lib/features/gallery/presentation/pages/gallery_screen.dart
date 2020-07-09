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
            height: 50,
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
                      "Seja Bem-Vindo",
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Acesse as fotos da galeria",
                    ),
                  ],
                ),
               
              ],
            ),
          ),
          SizedBox(
            height: 40,
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
        ],
      ),
    );
  }
}
