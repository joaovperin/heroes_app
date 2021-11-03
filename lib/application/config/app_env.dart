class AppEnv {
  static AppEnv? _instance;

  const AppEnv._();

  factory AppEnv() => _instance ??= const AppEnv._();

  Future<void> init() async {}

  String get heroesApiUrl => 'https://akabab.github.io/superhero-api/api/';
}
