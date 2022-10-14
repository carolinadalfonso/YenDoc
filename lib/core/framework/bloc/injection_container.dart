import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yendoc/domain/usecases/picture/get/get_pictures.dart';
import 'package:yendoc/domain/usecases/visits/get/get_report_visit.dart';

import '../../../data/datasources/authentication_datasource.dart';
import '../../../data/datasources/picture_datasource.dart';
import '../../../data/datasources/user_datasource.dart';
import '../../../data/datasources/visit_datasource.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/picture_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/repositories/visit_repository.dart';
import '../../../domain/repositories/iauthentication_repository.dart';
import '../../../domain/repositories/ipicture_repository.dart';
import '../../../domain/repositories/iuser_repository.dart';
import '../../../domain/repositories/ivisit_repository.dart';
import '../../../domain/usecases/change_password/post/post_change_password.dart';
import '../../../domain/usecases/login/post/post_login.dart';
import '../../../domain/usecases/picture/delete/delete_picture.dart';
import '../../../domain/usecases/picture/post/post_picture.dart';
import '../../../domain/usecases/visits/get/get_visit.dart';
import '../../../domain/usecases/visits/post/post_report_visit.dart';
import '../../../domain/usecases/visits/post/post_save_visit.dart';
import '../../../domain/usecases/visits/post/post_visits.dart';
import '../../../presentation/cubit/change_password/change_password_cubit.dart';
import '../../../presentation/cubit/delete_picture/delete_picture_cubit.dart';
import '../../../presentation/cubit/login/login_cubit.dart';
import '../../../presentation/cubit/picture_list/pictures_list_cubit.dart';
import '../../../presentation/cubit/save_picture/save_picture_cubit.dart';
import '../../../presentation/cubit/save_visit/save_visit_cubit.dart';
import '../../../presentation/cubit/visit/visit_cubit.dart';
import '../../../presentation/cubit/visits_list/visits_list_cubit.dart';
import '../../http/http_client.dart';
import '../../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Cubit
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => ChangePasswordCubit(sl()));
  sl.registerFactory(() => VisitsListCubit(sl(), sl()));
  sl.registerFactory(() => VisitCubit(sl(), sl()));
  sl.registerFactory(() => SaveVisitCubit(sl()));
  sl.registerFactory(() => SavePictureCubit(sl()));
  sl.registerFactory(() => PicturesListCubit(sl()));
  sl.registerFactory(() => DeletePictureCubit(sl()));

  //! Use Cases
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostChangePassword(sl()));
  sl.registerLazySingleton(() => PostVisits(sl()));
  sl.registerLazySingleton(() => GetVisit(sl()));
  sl.registerLazySingleton(() => PostSaveVisit(sl()));
  sl.registerLazySingleton(() => PostSavePicture(sl()));
  sl.registerLazySingleton(() => GetPictures(sl()));
  sl.registerLazySingleton(() => PostReportVisits(sl()));
  sl.registerLazySingleton(() => DeletePicture(sl()));
  sl.registerLazySingleton(() => GetReportVisit(sl()));

  //! Repositories
  sl.registerLazySingleton<IAuthenticationRepository>(() => AuthenticationRepository(dataSource: sl()));
  sl.registerLazySingleton<IUserRepository>(() => UserRepository(dataSource: sl()));
  sl.registerLazySingleton<IVisitRepository>(() => VisitRepository(dataSource: sl()));
  sl.registerLazySingleton<IPictureRepository>(() => PictureRepository(dataSource: sl()));

  //! Datasources
  sl.registerLazySingleton(() => AuthenticationDatasource(httpClient: sl()));
  sl.registerLazySingleton(() => UserDatasource(httpClient: sl()));
  sl.registerLazySingleton(() => VisitDatasource(httpClient: sl()));
  sl.registerLazySingleton(() => PictureDatasource(httpClient: sl()));

  //! Core
  sl.registerLazySingleton(() => HttpClient(client: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
