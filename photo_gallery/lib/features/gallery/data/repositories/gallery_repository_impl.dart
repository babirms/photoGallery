import 'package:dartz/dartz.dart';
import 'package:photo_gallery/core/network/network_info.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:photo_gallery/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:photo_gallery/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:meta/meta.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  final NetworkInfo networkInfo;
  final GalleryRemoteDataSource dataSource;

  GalleryRepositoryImpl(
      {@required this.networkInfo, @required this.dataSource});

  @override
  Future<Either<Failure, List<Image>>> getImages() async{
     if (await networkInfo.isConnected) {
      try {
        List<Image> image = await dataSource.getImages();
        return Right(image);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }


 
}
