import 'package:dummy_json/src/features/auth/features/register/datasource/register_datasource.dart';
import 'package:dummy_json/src/features/auth/features/register/viewmodel/register_viewmodel.dart';
import 'package:dummy_json/src/features/home/datasource/home_datasource.dart';
import 'package:dummy_json/src/features/home/viewmodel/home_viewmodel.dart';
import 'package:dummy_json/src/services/api_service.dart';
import 'package:dummy_json/src/services/http_service.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final getIt = GetIt.instance;

  static void setup() {
    //ApiService
    getIt.registerLazySingleton<ApiService>(() => HttpService());

    //Home
    getIt.registerLazySingleton<HomeDatasource>(
        () => HomeDatasource(getIt<ApiService>()));
    getIt.registerLazySingleton<HomeViewModel>(
        () => HomeViewModel(getIt<HomeDatasource>()));

    //Register
    getIt.registerLazySingleton<RegisterDatasource>(
        () => RegisterDatasource(getIt<ApiService>()));
    getIt.registerLazySingleton<RegisterViewModel>(
        () => RegisterViewModel(getIt<RegisterDatasource>()));
  }
}
