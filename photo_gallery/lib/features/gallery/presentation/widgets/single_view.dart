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
            children: <Widget>[
              SizedBox(
                height: Dimensions.getConvertedHeightSize(35, context),
              ),
              Text(
                "Visualização",
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 32),
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(82, 82, 82, 1),
                ),
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
                color: Colors.white,
                child: Text(
                  'Voltar'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black45,
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
