import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/core/resources/dimensions.dart';
import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart'
    as imageEntity;

class ConfirmImageScreen extends StatefulWidget {
  final String imagePath;

  const ConfirmImageScreen({Key key, this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConfirmImageScreenState();
  }
}

class _ConfirmImageScreenState extends State<ConfirmImageScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: Dimensions.getConvertedHeightSize(50, context),
              ),
              // Title
              Text(
                'Confirmação de Envio',
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 26),
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(82, 82, 82, 1),
                ),
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(1, context),
              ),
              Text(
                'Gostaria de enviar esta foto para a galeria?',
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 14),
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
              /*SizedBox(
                height: Dimensions.getConvertedHeightSize(20, context),
              ),*/
              // Visualização da Imagem coletada
              Container(
                padding: Dimensions.getEdgeInsetsAll(context, 20),
                child: Image.file(
                  File(widget.imagePath),
                  height: Dimensions.getConvertedHeightSize(350, context),
                ),
              ),
              // Navegação Básica pós Imagem
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: Dimensions.getEdgeInsetsFromLTRB(
                        context, 20, 14, 20, 14),
                    color: Colors.white,
                    child: Text(
                      'Cancelar'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  RaisedButton(
                    padding: Dimensions.getEdgeInsetsFromLTRB(
                        context, 30, 14, 30, 14),
                    color: Colors.purple,
                    child: Text('Salvar Imagem'.toUpperCase()),
                    onPressed: () {
                      imageEntity.Image imagem =
                          new imageEntity.Image(path: widget.imagePath);
                      BlocProvider.of<ImageBloc>(context)
                          .add(SaveImageEvent(image: imagem));
                      Navigator.of(context).popAndPushNamed('/');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
