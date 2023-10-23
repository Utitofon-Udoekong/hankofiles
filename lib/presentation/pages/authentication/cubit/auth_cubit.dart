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
  // AUTH FACADE CLASS. 
  final IAuthFacade iAuthFacade;
  AuthCubit(this.iAuthFacade) : super(AuthState.empty());

  // FUNCTION TO SET EMAIL FROM TEXT INPUT FIELDS
  void setEmail (String email) => emit(state.copyWith(email: email));
  // FUNCTION TO SET OTP CODE FROM INPUT FIELD
  void setCode (String code) => emit(state.copyWith(code: code));

  //FUNCTION TO SIGN IN A USER
  void signIn () async{
    final email = state.email.trim();
    load();
    // GETS A USER BY THE ENTERED EMAIL TO RETURN THE USER ID. tHE ID WILL BE USED TO GET THE USER OBJECT.
    final getEmailResponse = await iAuthFacade.getUserByEmail(email: email);
    if(getEmailResponse.isRight()){
      UserFromEmail? emailResponse = getEmailResponse.fold((l) => null, (r) => r);
      final requestUser = await iAuthFacade.getUserByID(id: emailResponse!.id);
      requestUser.fold((l) => fail(l), (r) {
        emit(state.copyWith(userModel: r));
        pass("User logged in successfully");
      });
    }else{
      getEmailResponse.fold((l) => fail(l), (r) => null);
    }
  }

  // FUNCTION TO CREATE A USER ON THE HANKO SERVER
  void signUp() async{
    final email = state.email.trim();
    load();
    final request = await iAuthFacade.createUser(email: email);
    request.fold((l) => fail(l), (r) {
      emit(state.copyWith(passcodeResponse: r));
      pass("OTP Sent");
    });
  }

  // FUNCTION TO VERIFY A USERS EMAIL AFTER SIGNUP
  void verifyEmail() async {
    final code = state.code;
    final uid = state.passcodeResponse.id;
    final request = await iAuthFacade.finalizePasscodeLogin(id: uid, code: code);
    request.fold((l) => fail(l), (r) async{
      emit(state.copyWith(passcodeResponse: r));
      final requestUser = await iAuthFacade.getUserByID(id: uid);
      requestUser.fold((l) => fail(l), (r) {
        emit(state.copyWith(userModel: r));
      });
      pass("User Verified");
    });
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
        code: ''));
}
