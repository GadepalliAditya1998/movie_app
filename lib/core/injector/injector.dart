import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/http.service.dart';
import 'package:movie_app/services/itask.service.dart';
import 'package:movie_app/services/task.service.dart';

class Injector {
  void configureDependencies() {
    this._configureSingletonServices();
    this._configureFactoryServices();
  }

  void _configureSingletonServices() {}

  void _configureFactoryServices() {
    injector.registerFactory<HttpService>(() => HttpService());
    injector.registerFactory<ITaskService>(() => TaskService(httpService: get<HttpService>()));
  }

  static GetIt get injector => GetIt.instance;

  static T get<T extends Object>({String? instanceName}) => injector<T>(instanceName: instanceName);
}
