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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        elevation: 3,
        title: Text(
          "Voltar para o início".toUpperCase(),
          style: TextStyle(
            fontSize: Dimensions.getTextSize(context, 18),
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(102, 102, 102, 1),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.path), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
