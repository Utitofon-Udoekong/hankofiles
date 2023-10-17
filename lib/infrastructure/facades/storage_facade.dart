import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: IStorageFacade)
class StorageFacade implements IStorageFacade{
  final Supabase supabase;

  StorageFacade(this.supabase);
  @override
  Future<Either<String, String>> deleteFile({required String path}) async {
    try {
      await supabase.client.storage.from("files").remove([path]);
      return right("File deleted");
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }
  @override
  Future<Either<String, String>> deleteFiles({required List<String> paths}) async {
    try {
      await supabase.client.storage.from("files").remove(paths);
      return right("Files deleted");
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

  @override
  Future<Either<String, Uint8List>> downloadFile({required String path}) async{
    try {
      final downloadFileRequest = await supabase.client.storage.from("files").download(path);
      return right(downloadFileRequest);
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

  @override
  Future<Either<String, String>> uploadFile({required File file, required String id}) async{
    try {
      await supabase.client.storage.from("files").upload("$id/${file.path}", file);
      return right("File uploaded");
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }
  
  
  @override
  Future<Either<String, List<FileObject>>> listFiles({required String id}) async{
    try {
      final files = await supabase.client.storage.from("files").list(path: id);
      return right(files);
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

}