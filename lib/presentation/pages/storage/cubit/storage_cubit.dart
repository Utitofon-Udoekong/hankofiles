import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';
import 'package:injectable/injectable.dart';

part 'storage_state.dart';
part 'storage_cubit.freezed.dart';

@lazySingleton
class StorageCubit extends Cubit<StorageState> {
  final IStorageFacade iStorageFacade;
  StorageCubit(this.iStorageFacade) : super(StorageState.empty());

  void fail(failure) => emit(state.copyWith(success: "", failure: failure, isLoading: false));
  void pass(success) => emit(state.copyWith(success: success, failure: "", isLoading: false));
  void load() => emit(state.copyWith(success: "", failure: "", isLoading: true));
  void reset() => emit(state.copyWith(
        failure: '',
        success: '',
        isLoading: false));
}
