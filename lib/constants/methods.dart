import 'package:dio/dio.dart';

DateTime getDateTimeFromISO8601String(String date) {
  return DateTime.parse(date);
}
DateTime? getNullableDateTimeFromISO8601String(String? date) {
  return date == null ? null : DateTime.parse(date);
}
bool isValidEmail(String email) {
    return RegExp(
            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
        .hasMatch(email);
  }

String handleExceptions(DioException e){
  print(e.message);
  if(e.response == null) return "No response from server";
  print(e.response!.statusCode);
  switch (e.type) {
    case DioExceptionType.connectionError:
      return "Internet connection error";
    case DioExceptionType.cancel:
      return "Request cancelled";
    case DioExceptionType.connectionTimeout:
      return "Connection Timeout";
    case DioExceptionType.receiveTimeout:
      return "Receive Timeout";
    case DioExceptionType.badResponse:
      return "Bad Response";
    default:
      e.response!.statusMessage!;
  }
  switch (e.response!.statusCode) {
    case 400:
      return "400: ${e.response!.statusMessage!}";
    case 404:
      return "404: ${e.response!.statusMessage!}";
    case 409:
      return "409: ${e.response!.statusMessage!}";
    case 500:
      return "500: ${e.response!.statusMessage!}";
    default:
      e.response!.statusMessage!;
  }
  return e.response!.statusMessage!;
}