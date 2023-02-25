import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();

  static String get functionsRegion =>
      dotenv.env['FUNCTIONS_REGION'] ?? (throw Exception('Missing env var: FUNCTIONS_REGION'));

  static String get functionsHostname =>
      dotenv.env['FUNCTIONS_HOSTNAME'] ?? (throw Exception('Missing env var: FUNCTIONS_HOSTNAME'));

  static int get functionsPort =>
      int.tryParse(dotenv.env['FUNCTIONS_PORT'] ?? (throw Exception('Missing env var: FUNCTIONS_PORT'))) ??
      (throw Exception('Invalid env var: FUNCTIONS_PORT'));

  static bool get useEmulator => dotenv.env['USE_EMULATOR'] == 'true';
}
