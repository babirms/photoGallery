import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_gallery/features/image/data/models/image_model.dart';
import 'package:meta/meta.dart';

abstract class ImageRemoteDataSource {
  Future<bool> saveImage(ImageModel imageModel);
  Future<ImageModel> getImage();
}

class ImageRemoteDataSourceImpl extends ImageRemoteDataSource {
  // nome da collection
  final String _collectionName = 'data';
  final Firestore firestore;

  ImageRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ImageModel> getImage() async {
    try {
      CollectionReference collection =
          Firestore.instance.collection(_collectionName);
      // TO DO: relacionar com a colection criada
      /*DocumentSnapshot imageSnapshot = await collection.document();
      return ImageModel.fromDocumentSnapshot(imageSnapshot);*/
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> saveImage(ImageModel imageModel) async {
    ImageModel imageResult;

    try {
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child('/images/${imageModel.path}');
      StorageUploadTask uploadTask =
          storageReference.putFile(File(imageModel.path));
      await uploadTask.onComplete;
      print('File Uploaded');
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
