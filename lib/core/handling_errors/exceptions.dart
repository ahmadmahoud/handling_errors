class PrimaryServerException implements Exception {
  final String error;
  final String message;
  final int code;

  PrimaryServerException({
    required this.error,
    required this.code,
    required this.message,
  });
}



// return string only ...

class SecondaryServerException implements Exception {
  final String error;

  SecondaryServerException({
    required this.error,
  });
}