import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SupabaseInjectableModule {
  @lazySingleton
  Supabase get _supabaseInstance => Supabase.instance;
  SupabaseAuth get _supabaseAuth => SupabaseAuth.instance;
 
}