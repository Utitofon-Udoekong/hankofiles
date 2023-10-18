import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IStorageFacade{
  Future<Either<String,String>> uploadFile({required File file, required String id, required String fileName});
  Future<Either<String,Uint8List>> downloadFile({required String path});
  Future<Either<String,String>> deleteFile({required String path});
  Future<Either<String,String>> deleteFiles({required List<String> paths});
  Future<Either<String,List<FileObject>>> listFiles({required String id});
  Either<String,String> getPublicUrl({required String id});
}