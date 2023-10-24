import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hankofiles/constants/constants.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/domain/facades/i_auth_facade.dart';
import 'package:hankofiles/domain/models/responses/response_models.dart';
import 'package:hankofiles/domain/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

final dio = Dio(BaseOptions(
    baseUrl: HANKO_URL,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      "Content-Type": "application/json"
    }
  ))
  ..interceptors.add(CookieManager(PersistCookieJar()));


@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade{

  /// CREATES A USER IN THE DATABASE. THIS METHOD SHOULD BE SUCCEDED BY A PASSCODE INITIALIZATION METHOD TO VERIFY THE EMAIL ADDRESS
  @override
  Future<Either<String,UserSignupDTO>> createUser({required String email}) async{
    Response response;
    PasscodeResponse passcodeResponse = PasscodeResponse.empty();
    try {
      response = await dio.post('/users', data: {
        "email": email
      } );
      final data = response.data;
      final userFromSignup = UserFromSignup.fromJson(data);
      final getPassCode = await initializePasscodeLogin(email_id: data["email_id"], user_id: data["user_id"]);
      if(getPassCode.isRight()){
        getPassCode.fold((l) => null, (r) {
          passcodeResponse = r;
        });
      }
      final userSignupDTO = UserSignupDTO(userFromSignup: userFromSignup, passcodeResponse: passcodeResponse);
      return right(userSignupDTO);
    } on DioException catch (e) {
      return left(handleExceptions(e));
    }
  }

  /// GET'S THE ID OF THE CURRENTLY SIGNED IN USER
  @override
  Future<Either<String,String>> getCurrentUserID({required String cookie}) async{
    Response response;
    try {
      response = await dio.get("/me");
      return right(response.data);
    } on DioException catch (e) {
     return left(handleExceptions(e));
    }
  }

  /// RETURNS A USER OBJECT WITH A UID AND EMAIL ID. THE UID CAN BE USED TO GET THE FULL USER OBJECT
  @override
  Future<Either<String,UserFromEmail>> getUserByEmail({required String email}) async{
    Response response;
    try {
      response = await dio.post("/user", data: {
        "email": email
      });
      final data = response.data;
      final user = UserFromEmail.fromJson(data);
      return right(user);
    } on DioException catch (e) {
      return left(handleExceptions(e));
    }
  }

  /// GET'S USER DETAILS BY AN ID. RETURNS A CONCISE USER OBJECT
  /// CANNOT USE WITHOUT A PRO SUBSCRIPTION. YOU'LL GET A 401 RESPONSE
  @override
  Future<Either<String,UserModel>> getUserByID({required String id}) async{
    Response response;
    try {
      response = await dio.get("/users/$id");
      final data = response.data;
      print(data);
      final userModel = UserModel.fromJson(data);
      return right(userModel);
    } on DioException catch (e) {
      return left(handleExceptions(e));
    } on HttpException catch (e){
      print(e);
      return left(e.message);
    }
  }

  //Logs out the current user
  @override
  Future<Either<String,String>> logout({required String cookie}) async {
    Response response;
    try {
      response = await dio.post("/logout");
      return right("Logged out");
    } on DioException catch (e) {
     return left(handleExceptions(e));
    }
  }

  /// INITIALIZE PASSCODE LOGIN. WILL REQUIRE A USER ID FROM A PREVIOUS POST REQUEST SUCH AS create_user
  @override
  Future<Either<String,PasscodeResponse>> initializePasscodeLogin({required String email_id, required String user_id}) async {
    Response response;
    try {
      response = await dio.post("/passcode/login/initialize",data: {
        "email_id": email_id,
        "user_id": user_id
      });
      final data = response.data;
      final passcodeResponse = PasscodeResponse.fromJson(data);
      return right(passcodeResponse);
    } on DioException catch (e) {
      return left(handleExceptions(e));
    }
  }

  /// FINALIZE PASSCODE LOGIN. ALSO USED TO VERIFY EMAIL ADDRESSES
  @override
  Future<Either<String,PasscodeResponse>> finalizePasscodeLogin({required String id, required String code}) async{
    Response response;
    try {
      response = await dio.post('/passcode/login/finalize', data: {
        "code": code,
        "id": id
      });
      final data = response.data;
      final passcodeResponse = PasscodeResponse.fromJson(data);
      return right(passcodeResponse);
    } on DioException catch (e) {
      return left(handleExceptions(e));
    }
  }


}