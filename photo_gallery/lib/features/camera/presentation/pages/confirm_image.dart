import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmImageScreen extends StatelessWidget {
  final String imagePath;

  const ConfirmImageScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            File(imagePath),
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
