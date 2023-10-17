import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final IStorageFacade iStorageFacade;
  HomeCubit(this.iStorageFacade) : super(HomeState.empty());

  void setFolderName(String folderName) => emit(state.copyWith(folderName: folderName));
  void setColor(Color color) => emit(state.copyWith(color: color));

  void createFolder()async {

  }

  // FUNCTION TO STORE FAILURES
  void fail(failure) => emit(state.copyWith(success: "", failure: failure, isLoading: false));
  // FUNCTION TO STORE SUCCESSES
  void pass(success) => emit(state.copyWith(success: success, failure: "", isLoading: false));
  // FUNCTION TO SET LOADING STATE
  void load() => emit(state.copyWith(success: "", failure: "", isLoading: true));
  // FUNCTION TO RESET THE CUBIT
  void reset() => emit(state.copyWith(
        failure: '',
        success: '',
        isLoading: false,
        folderName: '',
        ));

}
