import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/constants/constants.dart';
import 'package:hankofiles/domain/facades/i_auth_facade.dart';
import 'package:hankofiles/domain/models/responses/response_models.dart';
import 'package:hankofiles/domain/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

final dio = Dio(BaseOptions(
    baseUrl: HANKO_URL,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      "Content-Type": "application/json"
    }
  ))..interceptors.add(CookieManager(PersistCookieJar()));


@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade{
  @override
  Future<Either<String,UserModel>> createUser({required String email}) async{
    Response response;
    try {
      response = await dio.post('/users', data: {
        "emails":[{"address":email,"is_primary":false}]
      });
      final data = response.data;
      print(data);
      final userModel = UserModel.fromJson(data);
      return right(userModel);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      return left(e.message ?? "An error occured");
    }
  }


  @override
  Future<Either<String,String>> getCurrentUserID({required String cookie}) async{
    Response response;
    try {
      response = await dio.get("/me");
      print(response.data);
      return right(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }

  @override
  Future<Either<String,UserFromEmail>> getUserByEmail({required String email}) async{
    Response response;
    try {
      response = await dio.post("/user", data: {
        "email": email
      });
      final data = response.data;
      print(data);
      final user = UserFromEmail.fromJson(data);
      return right(user);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }

  @override
  Future<Either<String,UserModel>> getUserByID({required String id}) async{
    Response response;
    try {
      response = await dio.get("/users/$id");
      print(response.data);
      return right(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }

  @override
  Future<Either<String,String>> logout({required String cookie}) async {
    Response response;
    try {
      response = await dio.post("/logout");
      print(response.data);
      return right("Logged out");
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }

  @override
  Future<Either<String,PasscodeResponse>> passcodeLogin({required String email_id, required String user_id}) async {
    Response response;
    try {
      response = await dio.post("/passcode/login/initialize",data: {
        "email_id": email_id,
        "user_id": user_id
      });
      final data = response.data;
      print(data);
      final passcodeResponse = PasscodeResponse.fromJson(data);
      return right(passcodeResponse);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }

  @override
  Future<Either<String,PasscodeResponse>> finalizePasscodeLogin({required String id, required String code}) async{
    Response response;
    try {
      response = await dio.post('/passcode/login/finalize', data: {
        "code": code,
        "id": id
      });
      final data = response.data;
      print(data);
      final passcodeResponse = PasscodeResponse.fromJson(data);
      return right(passcodeResponse);
    } on DioException catch (e) {
      print(e.message);
      print(e.response!.statusCode);
      // if(e.type == DioExceptionType.connectionError) return left("No internet connection detected");
      // if(e.response == null) return left("OOPS. Server error encountered");
      // if(e.response!.statusCode == 401) return left("Session expired. Login to continue");
      return left(e.message ?? "An error occured");
    }
  }


}