import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SupabaseInjectableModule {
  @lazySingleton
  Supabase get supabase => Supabase.instance;
  SupabaseAuth get supabaseAuth => SupabaseAuth.instance;
}