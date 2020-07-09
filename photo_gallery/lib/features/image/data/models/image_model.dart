import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:meta/meta.dart';

class ImageModel extends Image {
  ImageModel({@required path}) : super(path: path);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (path != null) json['path'] = path;
    return json;
  }
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ImageModel(path: json['path']);
  }

  factory ImageModel.fromEntity(Image image) {
    if (image == null) return null;
    return ImageModel(path: image.path);
  }

  static ImageModel fromDocumentSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null || snapshot.data == null) return null;

    Map<String, dynamic> objectMap = snapshot.data;
    objectMap['id'] = snapshot.documentID;

    return ImageModel.fromJson(objectMap);
  }

  static List<ImageModel> getListFromDocumentsSnapshots(
      List<DocumentSnapshot> listDocs) {
    if (listDocs == null) return null;

    return listDocs.map((documentSnapshot) {
      return ImageModel.fromDocumentSnapshot(documentSnapshot);
    }).toList();
  }
}
