
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/constants/constants.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/presentation/core/widgets/app_loader.dart';
import 'package:hankofiles/presentation/core/widgets/app_snackbar.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:jiffy/jiffy.dart';

class Filepage extends StatelessWidget {
  const Filepage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final selectedFile = context.select((StorageCubit bloc) => bloc.state.supabaseFile);
    final isLoading = context.select((StorageCubit bloc) => bloc.state.isLoading);
    final fileSize = selectedFile.metadata!["size"];
    final fileType = selectedFile.metadata!["mimetype"];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFile.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: kBlack)),
        actions: [
          IconButton(
              onPressed: () async {
                final bytes = await context.read<StorageCubit>().downloadFile();
                String? outputPath = await FilePicker.platform.saveFile(
                  dialogTitle: 'Please select an output destination:',
                  fileName: selectedFile.name,
                );
                if(outputPath != null){
                  final file = File(outputPath);
                  await file.writeAsBytes(bytes);
                  AppSnackbar.showSnackBar(context, "File saved to $outputPath", false);
                }
              },
              icon: const Icon(Icons.file_download_rounded, color: kBlue))
        ],
      ),
      body: SafeArea(
          child: Apploader(
            isLoading: isLoading,
            child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FadeInImage.assetNetwork(
                placeholder: "images/loading-image.gif",
                image: getImageFromMimeType(fileType,context.read<StorageCubit>().getPublicUrl()),
                width: mediaSize.width,
                height: 300,
              ),
              const SizedBox(height: 20),
              Text(
                  "$fileType - ${bytesConverter(fileSize)} ${bytesFormatter(fileSize)}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: kBlack)),
              const SizedBox(height: 30),
              Text(
                "Added on",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: kBlack),
              ),
              const SizedBox(height: 6),
              Text(
                  Jiffy.parseFromDateTime(
                          getDateTimeFromISO8601String(selectedFile.createdAt!))
                      .yMMMMdjm,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: kBlack)),
              const SizedBox(height: 30),
              Text(
                "Last modified",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: kBlack),
              ),
              const SizedBox(height: 6),
              Text(
                  Jiffy.parseFromDateTime(
                          getDateTimeFromISO8601String(selectedFile.updatedAt!))
                      .yMMMMdjm,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: kBlack)),
            ]),
                  ),
                ),
          )),
    );
  }
}
