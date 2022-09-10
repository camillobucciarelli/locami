import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locale_manager/presentation/translations_list.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Locale manager'),
        ),
        body: const TranslationsList(),
      ),
    );
  }
}
