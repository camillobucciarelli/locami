import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final injector = GetIt.asNewInstance();

@InjectableInit()
Future<void> initDependencyInjection() async {
  $initGetIt(injector);
}

@module
abstract class ExternalPackages {
}
