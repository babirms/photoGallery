import 'package:photo_gallery/core/network/network_info.dart';
import 'package:photo_gallery/features/image/data/datasources/image_remote_data_source.dart';
import 'package:photo_gallery/features/image/data/models/image_model.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart';
import 'package:photo_gallery/core/resources/error.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_gallery/features/image/domain/repositories/image_repository.dart';
import 'package:meta/meta.dart';

class ImageRepositoryImpl extends ImageRepository {
  final NetworkInfo networkInfo;
  final ImageRemoteDataSource dataSource;

  ImageRepositoryImpl({@required this.networkInfo, @required this.dataSource});

  @override
  Future<Either<Failure, List<Image>>> getImages() async {
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

  @override
  Future<Either<Failure, bool>> saveImage(Image image) async {
    if (await networkInfo.isConnected) {
      try {
        final bool result = await dataSource.saveImage(ImageModel.fromEntity(image));
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
