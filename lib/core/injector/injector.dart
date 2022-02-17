import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/http.service.dart';

class Injector {
  void configureDependencies() {
    this._configureSingletonServices();
    this._configureFactoryServices();
  }

  void _configureSingletonServices() {}

  void _configureFactoryServices() {
    injector.registerFactory<HttpService>(() => HttpService());
  }

  static GetIt get injector => GetIt.instance;

  static T get<T>({String? instanceName}) => GetIt.instance<T>(instanceName: instanceName);
}
