import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/core/UI/image_card.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';

class SingleView extends StatefulWidget {
  final String path;
  final int ref;

  const SingleView({Key key, @required this.path, @required this.ref})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SingleViewState();
  }
}

class _SingleViewState extends State<SingleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(35, context),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(20, context),
                ),
                ImageCard(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.path,
                      height: Dimensions.getConvertedHeightSize(350, context),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(20, context),
                ),
                RaisedButton(
                  padding:
                      Dimensions.getEdgeInsetsFromLTRB(context, 20, 14, 20, 14),
                  color: Colors.purple,
                  child: Text(
                    'Voltar'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      
    );
  }
}
