import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class IStorageFacade{
  Future<Either<String,String>> uploadFile({required File file});
  Future<Either<String,String>> downloadFile({required File file});
  Future<Either<String,String>> deleteFile({required File file});
}