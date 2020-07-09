import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // Title
          Text(
            'Confirma envio?',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          // Visualização da Imagem coletada
          Image.file(
            File(widget.imagePath),
          ),
          // Navegação Básica pós Imagem
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                color: Colors.teal,
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                color: Colors.pinkAccent,
                child: Text('Salvar Imagem'),
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
    );
  }
}
