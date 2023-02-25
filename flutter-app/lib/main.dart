import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'application.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/env.dart';
import 'firebase_options.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Localization section.
    await EasyLocalization.ensureInitialized();

    // Load environment variables.
    await dotenv.load(fileName: const String.fromEnvironment('env'));

    // Firebase section.
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    if (Env.useEmulator) {
      FirebaseFunctions.instanceFor(region: Env.functionsRegion)
          .useFunctionsEmulator(Env.functionsHostname, Env.functionsPort);
    }

    // Dependency injection section.
    initDependencyInjection();

    // Web section.
    if (kIsWeb) {
      usePathUrlStrategy();
    }

    // App section.
    runApp(EasyLocalization(
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'en', countryCode: 'GB'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale.fromSubtags(languageCode: 'en', countryCode: 'GB'),
      useFallbackTranslations: true,
      child: const Application(),
    ));
  });
}
