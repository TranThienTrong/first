class HttpException implements Exception{
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return this.message;
  }

  @override
  // TODO: implement stackTrace
  StackTrace? get stackTrace => throw UnimplementedError();
}