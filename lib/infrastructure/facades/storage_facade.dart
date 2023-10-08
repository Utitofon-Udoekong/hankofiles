import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/domain/facades/i_storage_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: IStorageFacade)
class StorageFacade implements IStorageFacade{
  final Supabase supabase;

  StorageFacade(this.supabase);
  @override
  Future<Either<String, String>> deleteFile({required File file}) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> downloadFile({required File file}) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> uploadFile({required File file}) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

}