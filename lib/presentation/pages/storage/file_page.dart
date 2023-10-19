
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/presentation/core/widgets/app_snackbar.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';

class Filepage extends StatelessWidget {
  const Filepage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final selectedFile = context.select((StorageCubit bloc) => bloc.state.supabaseFile);
    final fileSize = selectedFile.metadata!["size"];
    final fileType = selectedFile.metadata!["mimetype"];
    ProgressDialog pd = ProgressDialog(context: context);
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
                final downloadDirectory = await getApplicationDocumentsDirectory();
                pd.show(max: 100, msg: 'File Downloading...', closeWithDelay: 1500);
                await context.read<StorageCubit>().downloadFile(onReceiveProgress: (received, total) async {
                final downloadsDirectory = await getDownloadsDirectory();
                  if (total != -1) {
                    if (received == total) {
                      pd.update(value: 100, msg: "File downloaded");
                      var url = context.read<StorageCubit>().getPublicUrl();
                      String filePath = "${downloadsDirectory!.path}/${url.split('/').last}";
                      try {
                        File("${downloadDirectory.path}/${url.split('/').last}").copy(filePath);
                        AppSnackbar.showSnackBar(context, "File saved to $filePath", false);
                      } catch(e) {
                        /// Always enters here
                        print(e);
                      }

                    } else if (received < total) {
                      int progress = (((received / total) * 100).toInt());
                      pd.update(value: progress);
                    }
                }}, path: downloadDirectory.path);
              },
              icon: const Icon(Icons.file_download_rounded, color: kPrimary))
        ],
      ),
      body: SafeArea(
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
              )),
    );
  }
}
