import 'package:cloud_firestore/cloud_firestore.dart';
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
      // create new document
      /*  DocumentReference newDoc =
          firestore.collection(_collectionName).document(firebaseUser.uid);
      newDoc.setData(imageModel.toJson(), merge: true);

      DocumentReference docRef =
      
          firestore.collection(_collectionName).document(firebaseUser.uid);
      DocumentSnapshot docSnapshot = await docRef.get();

      imageResult = ImageModel.fromDocumentSnapshot(docSnapshot);*/
      

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
