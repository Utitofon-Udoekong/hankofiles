import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'storage_state.dart';
part 'storage_cubit.freezed.dart';

@lazySingleton
class StorageCubit extends Cubit<StorageState> {
  final IStorageFacade iStorageFacade;
  StorageCubit(this.iStorageFacade) : super(StorageState.empty());
  //SELECT FILE FROM DEVICE AND SAVE TO STATE
  void selectFile(File file) => emit(state.copyWith(selectedFile: file));
  //SELECT FILE IN APP AND SAVE TO STATE
  void selectSupabaseFile(FileObject file) => emit(state.copyWith(supabaseFile: file));
  // SET FILE NAME
  void setFileName(String fileName) => emit(state.copyWith(fileName: fileName));
  //SET SEARCH QUERY
  void setSearchQuery(String searchQuery) {
    emit(state.copyWith(searchQuery: searchQuery));
    //RUN SEARCH FUNCTION 500MS AFTER CHANGE EVENT
    searchFiles();
  }
  // SELECT FILES TO DELETE
  void selectFilesToDelete(String filePath) {
    List<String> pathsToDelete = state.filePathsToDelete.toList();
    print(pathsToDelete.contains(filePath));
    if(pathsToDelete.contains(filePath)) {
      pathsToDelete.remove(filePath);
      emit(state.copyWith(filePathsToDelete: pathsToDelete));
      return;
    }
    pathsToDelete.add(filePath);
    emit(state.copyWith(filePathsToDelete: pathsToDelete));
  }
  // DELETE ALL FILES FROM STORAGE
  void selectAllFilesToDelete() {
    List<String> pathsToDelete = state.files.map((e) => "TEST ID/${e.id!}").toList();
    emit(state.copyWith(filePathsToDelete: pathsToDelete));
  }
  //LIST FILES FROM STORAGE
  void listFiles({required String id})async{
    load();
    final uploadRequest = await iStorageFacade.listFiles(id: id);
    uploadRequest.fold((l) => fail(l), (r) => emit(state.copyWith(files: r, queryFiles: r, isLoading: false)));
  }
  // SEARCH FILES FROM FILE LIST
  void searchFiles(){
    final query = state.searchQuery;
    final files = state.files;
    final sortFiles = files.where((element) => element.name.contains(query)).toList();
    emit(state.copyWith(queryFiles: sortFiles));
  }
  // UPLOAD FILES
  void uploadFile({required String id})async{
    final file = state.selectedFile;
    final fileName = state.fileName;
    Either<String, String> uploadRequest;
    load();
      uploadRequest = await iStorageFacade.uploadFile(file: file, id: id, fileName: fileName);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
  }
  // DELETE A FILE
  void deleteFile()async{
    final file = state.supabaseFile;
    load();
    final uploadRequest = await iStorageFacade.deleteFile(path: file.name);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
    listFiles(id: "TEST ID");
  }
  // DELETE MULTIPLE FILES
  void deleteFiles()async{
    List<String> pathsToDelete = state.filePathsToDelete;
    load();
    final uploadRequest = await iStorageFacade.deleteFiles(paths: pathsToDelete);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
    listFiles(id: "TEST ID");
  }
  // CREATE A BYTES ARRAY OF THE FILE TO BE SAVED ON THE DEVICE
  Future<Uint8List> downloadFile()async{
    final id = state.supabaseFile.name;
    Uint8List fileBytes = Uint8List.fromList([0]);
    load();
    final uploadRequest = await iStorageFacade.downloadFile(path: "TEST ID/$id");
    uploadRequest.fold((l) => fail(l), (r) {
      fileBytes = r;
      pass("File downloaded");
    }
    );
    return fileBytes;
  }
  // GETS A PUBLICLY VISIBLE URL OF THE FILE
  String getPublicUrl(){
    final id = state.supabaseFile.name;
    final request = iStorageFacade.getPublicUrl(id: id);
    String url = "";
    request.fold((l) => fail(l), (r) => url = r);
    return url;
  }

  //HELPER FUNCTIONS
  void fail(String failure) => emit(state.copyWith(success: "", failure: failure, isLoading: false));
  void pass(String success) => emit(state.copyWith(success: success, failure: "", isLoading: false));
  void load() => emit(state.copyWith(success: "", failure: "", isLoading: true));
  void reset() => emit(state.copyWith(
        failure: '',
        success: '',
        isLoading: false,
        searchQuery: '',
        fileName: '',
        selectedFile: File('')));
}
