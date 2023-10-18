import 'dart:typed_data';

import 'dart:io' as i;

import 'package:dartz/dartz.dart';
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
      await supabase.client.storage.from("hanko-files").remove([path]);
      return right("File deleted");
    } on StorageException catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }
  @override
  Future<Either<String, String>> deleteFiles({required List<String> paths}) async {
    try {
      await supabase.client.storage.from("hanko-files").remove(paths);
      return right("Files deleted");
    } on StorageException catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

  @override
  Future<Either<String, Uint8List>> downloadFile({required String path}) async{
    try {
      final downloadFileRequest = await supabase.client.storage.from("hanko-files").download(path);
      return right(downloadFileRequest);
    } on StorageException catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

  @override
  Future<Either<String, String>> uploadFile({required i.File file, required String id, required String fileName}) async{
    try {
      await supabase.client.storage.from("hanko-files").upload("$id/$fileName", file);
      return right("File uploaded");
    } on StorageException catch (e) {
      print(e);
      return left(e.message);
    }
  }
  
  
  @override
  Future<Either<String, List<FileObject>>> listFiles({required String id}) async{
    try {
      final files = await supabase.client.storage.from("hanko-files").list(path: "TEST ID", searchOptions: SearchOptions(sortBy: SortBy(column: "created_at", order: "desc")));
      return right(files);
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }
  
  @override
  Either<String, String> getPublicUrl({required String id}) {
    try {
      final file = supabase.client.storage.from("hanko-files").getPublicUrl("TEST ID/$id");
      return right(file);
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

}