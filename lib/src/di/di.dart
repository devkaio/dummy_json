import 'package:dummy_json/src/features/home/datasource/home_datasource.dart';
import 'package:dummy_json/src/features/home/viewmodel/home_viewmodel.dart';
import 'package:dummy_json/src/services/api_service.dart';
import 'package:dummy_json/src/services/http_service.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<ApiService>(() => HttpService());
    getIt.registerLazySingleton<HomeDatasource>(
        () => HomeDatasource(getIt<ApiService>()));
    getIt.registerLazySingleton<HomeViewModel>(
        () => HomeViewModel(getIt<HomeDatasource>()));
  }
}
