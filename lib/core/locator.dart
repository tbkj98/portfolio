import 'package:get_it/get_it.dart';
import 'package:portfolio/core/service/main_service.dart';

var locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<MainService>(
    () => MainService(),
  );
}
