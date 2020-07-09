import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_gallery/core/network/network_info.dart';
import 'package:photo_gallery/features/image/data/datasources/image_remote_data_source.dart';
import 'package:photo_gallery/features/image/data/repositories/image_repository_impl.dart';
import 'package:photo_gallery/features/image/domain/repositories/image_repository.dart';
import 'package:photo_gallery/features/image/domain/usecases/get_images.dart';
import 'package:photo_gallery/features/image/domain/usecases/save_image.dart';
import 'package:photo_gallery/features/image/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() async {
  //! Features - Number Trivia
  _initImage();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Firestore.instance);
  sl.registerLazySingleton(() => FirebaseApp.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}

void _initImage() {
  // Bloc
  sl.registerFactory(
    () => ImageBloc(getImages: sl(), saveImage: sl()),
  );
  // UseCases
  sl.registerLazySingleton(() => SaveImage(sl()));
  sl.registerLazySingleton(() => GetImages(sl()));
  // Repository
  sl.registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(dataSource: sl(), networkInfo: sl()));
  // DataSource
  sl.registerLazySingleton<ImageRemoteDataSource>(
    () => ImageRemoteDataSourceImpl(firestore: sl()));
  
}
