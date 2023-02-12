
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final injector = GetIt.asNewInstance();

@InjectableInit()
void initDependencyInjection() {
  injector.init();
}
