class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException(String message)
      : super(message, "No Internet Connection");
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException(message) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(message) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message, "Invalid Input: ");
}
