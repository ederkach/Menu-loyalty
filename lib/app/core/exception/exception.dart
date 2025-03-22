class ServerException implements Exception {
  final String? message;

  const ServerException({this.message = 'Something with server!'});

  @override
  String toString() {
    return 'Error :$message ';
  }
}

class LocalException implements Exception {
  final String? message;

  const LocalException({this.message = 'Something went wrong!'});

  @override
  String toString() {
    return 'Error :$message ';
  }
}
