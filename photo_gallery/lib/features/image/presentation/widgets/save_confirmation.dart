import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';

class SaveConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/confirmation.png',
          width: Dimensions.getConvertedWidthSize(400, context),
        ),
        Container(
          padding: Dimensions.getEdgeInsetsAll(context, 20),
          child: Text(
            'Imagem enviada com sucesso !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.getTextSize(context, 14),
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
        ),
        RaisedButton(
          padding: Dimensions.getEdgeInsetsFromLTRB(context, 30, 14, 30, 14),
          color: Colors.purple,
          textColor: Colors.white,
          child: Text('Voltar ao início'.toUpperCase()),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
      ],
    );
  }
}
