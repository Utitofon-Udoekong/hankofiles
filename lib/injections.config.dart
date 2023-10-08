// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hankofiles/domain/facades/i_auth_facade.dart' as _i3;
import 'package:hankofiles/domain/facades/i_storage_facade.dart' as _i7;
import 'package:hankofiles/infrastructure/abstractions/app_injectables.dart'
    as _i10;
import 'package:hankofiles/infrastructure/facades/auth_facade.dart' as _i4;
import 'package:hankofiles/infrastructure/facades/storage_facade.dart' as _i8;
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart'
    as _i6;
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart'
    as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:supabase_flutter/supabase_flutter.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final supabaseInjectableModule = _$SupabaseInjectableModule();
    gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade());
    gh.lazySingleton<_i5.Supabase>(() => supabaseInjectableModule.supabase);
    gh.factory<_i5.SupabaseAuth>(() => supabaseInjectableModule.supabaseAuth);
    gh.lazySingleton<_i6.AuthCubit>(() => _i6.AuthCubit(gh<_i3.IAuthFacade>()));
    gh.lazySingleton<_i7.IStorageFacade>(
        () => _i8.StorageFacade(gh<_i5.Supabase>()));
    gh.lazySingleton<_i9.StorageCubit>(
        () => _i9.StorageCubit(gh<_i7.IStorageFacade>()));
    return this;
  }
}

class _$SupabaseInjectableModule extends _i10.SupabaseInjectableModule {}
