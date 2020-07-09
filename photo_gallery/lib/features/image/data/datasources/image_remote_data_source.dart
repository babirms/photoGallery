import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_gallery/features/image/data/models/image_model.dart';
import 'package:meta/meta.dart';

abstract class ImageRemoteDataSource {
  Future<bool> saveImage(ImageModel imageModel);
  Future<List<ImageModel>> getImages();
}

class ImageRemoteDataSourceImpl extends ImageRemoteDataSource {
  // nome da collection
  final String _collectionName = 'images';
  final Firestore firestore;

  ImageRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<List<ImageModel>> getImages() async {
    try {
       CollectionReference collectionReference =
          firestore.collection(_collectionName);

      QuerySnapshot querySnapshot = await collectionReference.getDocuments();
      List<DocumentSnapshot> listDoc = querySnapshot.documents;
      return ImageModel.getListFromDocumentsSnapshots(listDoc);
      
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> saveImage(ImageModel imageModel) async {
    ImageModel imageResult;

    try {
      // envia a imagem para o Storage
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child('${imageModel.path}');
      StorageUploadTask uploadTask =
          storageReference.putFile(File(imageModel.path));
      await uploadTask.onComplete;
      print('File Uploaded');
      /*************************************/

      // salva o path no database
      DocumentReference docRef =
          firestore.collection(_collectionName).document();
      docRef.setData(imageModel.toJson(), merge: true);

    } on Exception catch (e) {
      throw e;
    }
    if (imageResult == null) {
      return false;
    } else {
      return true;
    }
  }
}
