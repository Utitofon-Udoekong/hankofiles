import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/constants/constants.dart';

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
  if(e.response == null) return e.message;
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

IconData getIconDataFromMimeType(String mimeType){
  if(mimeType.contains("image")){
    return Icons.image;
  }else if(mimeType.contains("audio") || mimeType.contains("octet-stream")){
    return Icons.audio_file_rounded;
  }else if(mimeType.contains("video")){
    return Icons.video_file_rounded;
  }else{
    return Icons.file_copy_rounded;
  }
}
String getImageFromMimeType(String mimeType, String custom){
  if(mimeType.contains("image")){
    return custom;
  }else if(mimeType.contains("audio") || mimeType.contains("octet-stream")){
    return MUSIC_FILE;
  }else if(mimeType.contains("video")){
    return VIDEO_FILE;
  }else{
    return IMAGE_FILE;
  }
}

String bytesFormatter(int bytes) {

  if (bytes >= 1e9) {
    return "Gb";
  } else if (bytes >= 1e6) {
    return "Mb";
  } else {
    return "Kb";
  }
}

String bytesConverter(int bytes) {

  if (bytes >= 1e9) {
    return (bytes / 1e9).toStringAsFixed(2);
  } else if (bytes >= 1e6) {
    return (bytes / 1e6).toStringAsFixed(2);
  } else {
    return (bytes / 1000).toStringAsFixed(2);
  }
}


/// A stub for the `dart:io` [File] class. Only the methods used by the storage client are stubbed.

