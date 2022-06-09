class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException(message: $message)';
}

class FetchDataException extends ServerException {
  FetchDataException(String message) : super(message);
}

class DataFormateException extends ServerException {
  DataFormateException(String message) : super(message);
}

class BadRequestException extends ServerException {
  BadRequestException(String message) : super(message);
}

class UnauthorisedException extends ServerException {
  UnauthorisedException(String message) : super(message);
}

class InvalidInputException extends ServerException {
  InvalidInputException(String message) : super(message);
}

class InternalServerException extends ServerException {
  InternalServerException(String message) : super(message);
}

class NetworkException extends ServerException {
  NetworkException(String message) : super(message);
}

class UnknowException extends ServerException {
  UnknowException(String message) : super(message);
}

class ObjectToModelException extends ServerException {
  ObjectToModelException(String message) : super(message);
}
