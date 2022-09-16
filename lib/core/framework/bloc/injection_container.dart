import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yendoc/core/http/http_client.dart';
import 'package:yendoc/core/network/network_info.dart';
import 'package:yendoc/data/datasources/authentication_datasource.dart';
import 'package:yendoc/data/repositories/authentication_repository.dart';
import 'package:yendoc/domain/repositories/iauthentication_repository.dart';
import 'package:yendoc/domain/usecases/login/post/post_login.dart';
import 'package:yendoc/presentation/cubit/login/login_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../data/datasources/user_datasource.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../domain/repositories/iuser_repository.dart';
import '../../../domain/usecases/change_password/post/post_change_password.dart';
import '../../../presentation/cubit/change_password/change_password_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Cubit
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => ChangePasswordCubit(sl()));

  //! Use Cases
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostChangePassword(sl()));

  //! Repositories
  sl.registerLazySingleton<IAuthenticationRepository>(() => AuthenticationRepository(dataSource: sl()));
  sl.registerLazySingleton<IUserRepository>(() => UserRepository(dataSource: sl()));

  //! Datasources
  sl.registerLazySingleton(() => AuthenticationDatasource(httpClient: sl()));
  sl.registerLazySingleton(() => UserDatasource(httpClient: sl()));

  //! Core
  sl.registerLazySingleton(() => HttpClient(client: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}