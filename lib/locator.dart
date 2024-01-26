
import 'package:get_it/get_it.dart';
import 'package:mena_conf/core/services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
