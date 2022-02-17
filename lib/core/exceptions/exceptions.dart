class AppException implements Exception {
  String message;
  AppException({this.message = ''});
}

class BadRequestException extends AppException {}

class NoInternetException extends AppException {}

class UnAuthorizedException extends AppException {}

class InternalServerException extends AppException {}

class ForbiddenException extends AppException {}
