import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/domain/models/responses/response_models.dart';
import 'package:hankofiles/domain/models/user_model.dart';

abstract class IAuthFacade{
  Future<Either<String,UserFromEmail>> getUserByEmail({required String email});
  Future<Either<String,PasscodeResponse>> createUser({required String email});
  Future<Either<String,UserModel>> getUserByID({required String id});
  Future<Either<String,String>> getCurrentUserID({required String cookie});
  Future<Either<String,String>> logout({required String cookie});
  Future<Either<String,PasscodeResponse>> initializePasscodeLogin({required String email_id, required String user_id});
  Future<Either<String,PasscodeResponse>> finalizePasscodeLogin({required String id, required String code});
}