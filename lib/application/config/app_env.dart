import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static AppEnv? _instance;

  const AppEnv._();

  factory AppEnv() => _instance ??= const AppEnv._();

  Future<void> init() async {
    await dotenv.load(fileName: 'dotenv.env');
  }

  String get heroesApiUrl => _getOrThrow('HEROES_API_URL');
  String get heroesApiKey => _getOrThrow('HEROES_API_KEY');

  static String _getOrThrow(String key) {
    final value = dotenv.env[key];
    if (value == null) {
      throw 'Missing environment variable: $key';
    }
    return value;
  }
}
