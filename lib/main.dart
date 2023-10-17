import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hankofiles/constants/constants.dart';
import 'package:hankofiles/injections.dart';
import 'package:hankofiles/presentation/core/app.dart';
import 'package:hankofiles/presentation/core/bloc_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async  {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );
  Bloc.observer = AppBlocObserver();
  runApp(const AppBuilder());
}