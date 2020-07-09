import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:photo_gallery/features/image/data/models/image_model.dart';

abstract class GalleryRemoteDataSource {
  Future<List<ImageModel>> getImages();
}

class GalleryRemoteDataSourceImpl extends GalleryRemoteDataSource {
  // nome da collection
  final String _collectionName = 'images';
  final Firestore firestore;

  GalleryRemoteDataSourceImpl({@required this.firestore});
  @override
  Future<List<ImageModel>> getImages() async{
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
}
