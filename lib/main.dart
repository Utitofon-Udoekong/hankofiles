import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hankofiles/injections.dart';
import 'package:hankofiles/presentation/core/app.dart';
import 'package:hankofiles/presentation/core/bloc_observer.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const AppBuilder());
}