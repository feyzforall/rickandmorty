import '../enums/exception_type.dart';

class ApplicationException implements Exception {
  final ExceptionType _type;

  ApplicationException(this._type);

  @override
  String toString() => _type.message();
}
