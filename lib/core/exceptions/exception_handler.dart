import 'package:movie_app/core/exceptions/exceptions.dart';

class AppExceptionHandler {
  // This callback will be called when any uncaught exception comes in the application.
  static void onException(Object err, StackTrace trace) {
    if (err is NoInternetException) {
      print('No internet');
    } else if (err is UnAuthorizedException) {
      print(err.message);
    }

    print(err.runtimeType);
  }
}
