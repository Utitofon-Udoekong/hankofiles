import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/domain/facades/i_auth_facade.dart';
import 'package:hankofiles/domain/models/responses/response_models.dart';
import 'package:hankofiles/domain/models/user_model.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade iAuthFacade;
  AuthCubit(this.iAuthFacade) : super(AuthState.empty());
  void fail(failure) => emit(state.copyWith(success: "", failure: failure, isLoading: false));
  void pass(success) => emit(state.copyWith(success: success, failure: "", isLoading: false));
  void load() => emit(state.copyWith(success: "", failure: "", isLoading: true));
  void reset() => emit(state.copyWith(
        failure: '',
        success: '',
        isLoading: false));
}
