import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hankofiles/injections.dart';
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:hankofiles/presentation/router/router.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<StorageCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Hanko Files',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.ralewayTextTheme(
                Theme.of(context).textTheme,
              ),
              scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: router,
      ),
    );
  }
}
