import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Future setEnvironment({String? forceEnv}) async {
    switch (forceEnv ?? env) {
      case 'DEV':
        await dotenv.load(fileName: 'assets/config/dev.env');
        break;
      case 'PROD':
        await dotenv.load(fileName: 'assets/config/prod.env');
        break;
    }
  }

  static String get env =>
      const String.fromEnvironment('ENV', defaultValue: 'DEV').toUpperCase();

  static bool get isDev => env == 'DEV';

  static String get apiUrl => dotenv.get('API_URL');
  static String get apiKey => dotenv.get('API_KEY');
}
