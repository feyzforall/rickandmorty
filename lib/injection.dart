import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio.dart';
import 'data/repositories/character_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Core

  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepository(
      DioClient(),
    ),
  );

  // Cubit

  // 3rd party
  getIt.registerLazySingleton<Dio>(() => Dio());
}
