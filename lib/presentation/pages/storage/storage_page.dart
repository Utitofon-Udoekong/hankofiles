import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hankofiles/presentation/core/widgets/app_loader.dart';
import 'package:hankofiles/presentation/pages/storage/widgets/folder_card.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  void initState() {
    super.initState();
    context.read<StorageCubit>().listFiles(id: "TEST ID");
  }

  @override
  Widget build(BuildContext context) {
    final files = context.select((StorageCubit bloc) => bloc.state.files);
    final isLoading =
        context.select((StorageCubit bloc) => bloc.state.isLoading);
    final filesToDelete =
        context.select((StorageCubit bloc) => bloc.state.filePathsToDelete);
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: kBlack)),
      ),
      body: SafeArea(
        child: Apploader(
          isLoading: isLoading,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                filesToDelete.isNotEmpty ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Selected: ${filesToDelete.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: kBlack)),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => context
                                .read<StorageCubit>()
                                .selectAllFilesToDelete(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Select All",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: kWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => filesToDelete.isNotEmpty
                            ? context.read<StorageCubit>().deleteFiles()
                            : context.read<StorageCubit>().deleteFile(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Delete",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: kWhite),
                          ),
                        ),
                      )
                    ]) : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Column(
                      children: files.map((file) {
                    return Column(
                      children: [
                        FolderCard(
                          onTap: filesToDelete.isNotEmpty
                              ? () => context
                                  .read<StorageCubit>()
                                  .selectFilesToDelete("TEST ID/${file.id}")
                              : (){
                                context.read<StorageCubit>().selectSupabaseFile(file);
                                context.push("/file");
                              },
                          onLongPress: () => context
                              .read<StorageCubit>()
                              .selectFilesToDelete("TEST ID/${file.id}"),
                          color: pickerColors[
                              Random().nextInt(pickerColors.length)],
                          title: file.name,
                          createdAt: file.createdAt!,
                          mimeType: file.metadata!["mimetype"] ?? "application",
                        ),
                        const SizedBox(height: 20)
                      ],
                    );
                  }).toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
