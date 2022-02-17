import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/injector/injector.dart';

import 'app.dart';
import 'core/exceptions/exception_handler.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    // This will throw the error on to the console
    FlutterError.onError = (err) => FlutterError.presentError(err);

    _configureDependencies();
    runApp(const MyApp());
  }, AppExceptionHandler.onException);
}

// This configures all the application dependencies
// Dependency injection for the application, delegated to a different file.
void _configureDependencies() {
  Injector().configureDependencies();
}
