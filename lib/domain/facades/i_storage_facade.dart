import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

abstract class IStorageFacade{
  Future<Either<String,String>> uploadFile({required File file, required String id, required String fileName});
  Future<Either<String,String>> downloadFile({required String path, required String url, required void Function(int, int)? onReceiveProgress});
  Future<Either<String,String>> deleteFile({required String path});
  Future<Either<String,String>> deleteFiles({required List<String> paths});
  Future<Either<String,List<FileObject>>> listFiles({required String id});
  String getPublicUrl({required String id});
}