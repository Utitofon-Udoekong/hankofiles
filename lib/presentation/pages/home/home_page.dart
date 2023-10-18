import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    context.read<StorageCubit>().listFiles(id: "TEST ID");
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
        title: Text("Hankofiles",
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.storage_rounded),
            onPressed: () => context.push("/storage")
          )
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
                    createdAt: file.createdAt!,
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
              backgroundColor: kRed,
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
