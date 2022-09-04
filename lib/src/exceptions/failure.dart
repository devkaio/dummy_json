// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure implements Exception {
  final String message;
  final int code;
  final String type;

  Failure({
    required this.message,
    required this.code,
    required this.type,
  });
}
