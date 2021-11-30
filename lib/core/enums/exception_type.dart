enum ExceptionType {
  requestCancelled,
  requestTimeout,
  noInternetConnection,
  timeout,
  unauthorisedRequest,
  badRequest,
  notFound,
  internalServerError,
  serviceUnavailable,
  unknownError,
  formatException,
}

extension ExceptionTypeExtension on ExceptionType {
  String message() {
    switch (this) {
      case ExceptionType.requestCancelled:
        return ('Request Cancelled');

      case ExceptionType.requestTimeout:
        return ('Request Timeout');

      case ExceptionType.noInternetConnection:
        return ('No Internet Connection');

      case ExceptionType.timeout:
        return ('Request Timeout');

      case ExceptionType.unauthorisedRequest:
        return ('Unauthorised Request');

      case ExceptionType.notFound:
        return ('Not Found');

      case ExceptionType.internalServerError:
        return ('Internal Server Error');

      case ExceptionType.serviceUnavailable:
        return ('Service Unavailable');

      case ExceptionType.unknownError:
        return ('Unknown Error');

      case ExceptionType.formatException:
        return ('Format Exception');

      case ExceptionType.badRequest:
        return ('Bad Request');
    }
  }
}
