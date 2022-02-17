import 'package:get_it/get_it.dart';

class Injector {
  void configureDependencies() {
    this._configureSingletonServices();
    this._configureFactoryServices();
  }

  void _configureSingletonServices() {}

  void _configureFactoryServices() {}

  static GetIt get injector => GetIt.instance;

  static T get<T>({String? instanceName}) => GetIt.instance<T>(instanceName: instanceName);
}
