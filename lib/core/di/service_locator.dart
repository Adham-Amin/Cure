import 'package:cure/features/doctors/data/data_source/doctors_remote_data_source.dart';
import 'package:cure/features/doctors/data/repos/doctors_repo_impl.dart';
import 'package:cure/features/doctors/domain/repo/doctor_repo.dart';
import 'package:cure/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cure/features/home/data/repos/home_repo_impl.dart';
import 'package:cure/features/home/domain/repos/home_repo.dart';
import 'package:cure/features/specialties/data/data_source/specialties_remote_data_source.dart';
import 'package:cure/features/specialties/data/repo/specialties_repo_impl.dart';
import 'package:cure/features/specialties/domain/repo/specialties_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:cure/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SpecialtiesRemoteDataSource>(
    () => SpecialtiesRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SpecialtiesRepo>(
    () => SpecialtiesRepoImpl(
      specialtiesRemoteDataSource: getIt<SpecialtiesRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<DoctorsRemoteDataSource>(
    () => DoctorsRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<DoctorsRepo>(
    () => DoctorsRepoImpl(
      doctorsRemoteDataSource: getIt<DoctorsRemoteDataSource>(),
    ),
  );
}
