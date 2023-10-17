import 'dart:io';
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
  void selectFile(File file) => emit(state.copyWith(selectedFile: file));
  void selectFilesToDelete(String filePath) {
    List<String> pathsToDelete = state.filePathsToDelete.toList();
    pathsToDelete.add(filePath);
    emit(state.copyWith(filePathsToDelete: pathsToDelete));
  }
  listFiles({required String id})async{
    load();
    final uploadRequest = await iStorageFacade.listFiles(id: id);
    uploadRequest.fold((l) => fail(l), (r) => emit(state.copyWith(files: r, isLoading: false)));
  }
  uploadFile({required String id})async{
    final file = state.selectedFile;
    load();
    final uploadRequest = await iStorageFacade.uploadFile(file: file, id: id);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
  }
  deleteFile({required String id})async{
    final file = state.supabaseFile;
    load();
    final uploadRequest = await iStorageFacade.deleteFile(path: file.name);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
  }
  deleteFiles({required String id})async{
    List<String> pathsToDelete = state.filePathsToDelete;
    load();
    final uploadRequest = await iStorageFacade.deleteFiles(paths: pathsToDelete);
    uploadRequest.fold((l) => fail(l), (r) => pass(r));
  }

  void fail(String failure) => emit(state.copyWith(success: "", failure: failure, isLoading: false));
  void pass(String success) => emit(state.copyWith(success: success, failure: "", isLoading: false));
  void load() => emit(state.copyWith(success: "", failure: "", isLoading: true));
  void reset() => emit(state.copyWith(
        failure: '',
        success: '',
        isLoading: false));
}
