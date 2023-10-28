import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/presentation/core/widgets/app_form_field.dart';
import 'package:hankofiles/presentation/pages/storage/widgets/folder_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _debounceTimer;
  @override
  void initState() {
    super.initState();
    
  }

  _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      context.read<StorageCubit>().setSearchQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final files = context.select((StorageCubit bloc) => bloc.state.queryFiles);
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Van Files",
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.storage_rounded),
            onPressed: () => context.push("/storage")
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              var dialog = const LogoutDialog();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return dialog;
                          });
            }
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppFormField(
                hintText: "Search Files",
                onChanged: _onSearchChanged
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: files.isNotEmpty ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: files.map((file) {
              return Column(
                children: [
                  FolderCard(
                    onTap: () {
                      context.read<StorageCubit>().selectSupabaseFile(file);
                      context.push("/storage/file");
                    },
                    color:
                        pickerColors[Random().nextInt(pickerColors.length)],
                    title: file.name,
                    createdAt: file.createdAt ?? "",
                    mimeType: file.metadata!["mimetype"] ?? "application",
                  ),
                  const SizedBox(height: 20)
                ],
              );
            }).toList(),
          ),
        ) : Center(child: Text("You have no file stored", style: Theme.of(context).textTheme.titleMedium,)),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: kPrimary,
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
              onPressed: () => context.push("/upload-file")),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("You're about to log out"),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: [
        Row(children: [
          InkWell(
            onTap: () async {
              context.read<AuthCubit>().reset();
              context.read<StorageCubit>().reset();
              context.pushReplacement("/onboarding");
              // await SessionManager.clearSession();
              // await context.read<AuthCubit>().signOut().then((signedOut) {
              //   if (signedOut) {
              //   }
              // });
            },
            child: Container(
              alignment: Alignment.center,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kRed,
              ),
              child: Text(
                "Logout",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: kWhite),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBlack,
              ),
              child: Text(
                "Cancel",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: kWhite),
              ),
            ),
          ),
        ])
      ],
      backgroundColor: kWhite,
      contentPadding: const EdgeInsets.all(30),
      actionsPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
    );
  }
}