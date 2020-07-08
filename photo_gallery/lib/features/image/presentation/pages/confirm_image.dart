import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmImageScreen extends StatefulWidget {
  final String imagePath;

  const ConfirmImageScreen({Key key, this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConfirmImageScreenState();
  }
}

class _ConfirmImageScreenState extends State<ConfirmImageScreen> {
  String _uploadedFileURL;
  // construção da tela
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
                  //Navigator.of(context).popAndPushNamed('/');
                  uploadFile();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
Future uploadFile() async {
  // Cria uma referência para o local que você deseja fazer o upload da imagem 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('/images/${widget.imagePath}');  
   // realiza o upload da imagem no firebase      
   StorageUploadTask uploadTask = storageReference.putFile(File(widget.imagePath));    
   await uploadTask.onComplete;    
   print('File Uploaded'); 

   
 }  
}
