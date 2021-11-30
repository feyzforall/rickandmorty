abstract class Failure {
  final String message;

  Failure(this.message);
}

class HttpError extends Failure {
  HttpError(String message) : super(message);
}
