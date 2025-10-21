import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:perfect_touch_task/core/di/service_locater.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)

void setupDependencyInjection() => getIt.init();

