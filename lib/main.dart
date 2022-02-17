import 'package:flutter/material.dart';
import 'package:movie_app/core/injector/injector.dart';

import 'app.dart';
import 'core/exceptions/exception_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _configureDependencies();
  _configureGlobalExceptionHandler();

  runApp(const MyApp());
}

void _configureDependencies() {
  Injector().configureDependencies();
}

void _configureGlobalExceptionHandler() {
  FlutterError.onError = (err) {
    // This will throw the error on to the console
    FlutterError.presentError(err);

    // This will handle all the exceptions in global level, if left uncaught
    AppExceptionHandler.onException(err);
  };
}
