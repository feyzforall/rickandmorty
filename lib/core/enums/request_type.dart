enum RequestMethod { get, post }

extension RequestMethodExtension on RequestMethod {
  String get requestMethodValue {
    switch (this) {
      case RequestMethod.get:
        return 'GET';
      case RequestMethod.post:
        return 'POST';
      default:
        return 'GET';
    }
  }
}
