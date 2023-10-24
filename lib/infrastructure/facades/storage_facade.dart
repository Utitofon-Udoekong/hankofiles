import 'dart:io' show HttpHeaders, File;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final dio = Dio();

@LazySingleton(as: IStorageFacade)
class StorageFacade implements IStorageFacade{
  final Supabase supabase;

  StorageFacade(this.supabase);

  ///Deletes a file from a [path]
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

  /// Deletes a batch of files from a list of [paths]
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

  /// Sends a request using a dio http server to download a file from the specified [url]. Sves file to the [path] provided
  @override
  Future<Either<String, String>> downloadFile({required String path, required String url, required void Function(int, int)? onReceiveProgress}) async{
    try {
      await dio.download(
        url,
        "$path/${url.split('/').last}",
        options: Options(
          headers: {HttpHeaders.acceptEncodingHeader: "*"}
        ),
        onReceiveProgress: onReceiveProgress
      );
      return right("File downloaded from network");
    } on DioException catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }

  /// Uploads a file to supabase, under an [id] folder
  @override
  Future<Either<String, String>> uploadFile({required File file, required String id, required String fileName}) async{
    try {
      await supabase.client.storage.from("hanko-files").upload("$id/$fileName", file);
      return right("File uploaded");
    } on StorageException catch (e) {
      print(e);
      return left(e.message);
    }
  }
  
  /// return a list of FileObject stored in supabase
  @override
  Future<Either<String, List<FileObject>>> listFiles({required String id}) async{
    /// TODO: FIX NO ID IS BEING PASSED
    try {
      final files = await supabase.client.storage.from("hanko-files").list(path: id, searchOptions: const SearchOptions(sortBy: SortBy(column: "created_at", order: "desc")));
      return right(files);
    } on SupabaseRealtimeError catch (e) {
      print(e);
      return left(e.message.toString());
    }
  }
  
  /// Retuurns a live url to use for download operations.
  @override
  String getPublicUrl({required String id}) => supabase.client.storage.from("hanko-files").getPublicUrl(id);

}