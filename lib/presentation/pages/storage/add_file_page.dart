import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hankofiles/presentation/core/widgets/app_button.dart';
import 'package:hankofiles/presentation/core/widgets/app_loader.dart';
import 'package:hankofiles/presentation/core/widgets/app_snackbar.dart';
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/presentation/core/widgets/app_form_field.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  bool addToFolder = false;
  @override
  Widget build(BuildContext context) {
    final uid = context.select((AuthCubit bloc) => bloc.state.userModel.id);
    final size = MediaQuery.of(context).size;
    final isLoading =
        context.select((StorageCubit bloc) => bloc.state.isLoading);
    final selectedFile =
        context.select((StorageCubit bloc) => bloc.state.selectedFile);
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload a file",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: kBlack)),
      ),
        body: MultiBlocListener(
      listeners: [
        BlocListener<StorageCubit, StorageState>(
          listenWhen: (p,c) => p.failure != c.failure && c.failure.isNotEmpty,
          listener: (context, state) {
            AppSnackbar.showSnackBar(context, state.failure, true);
          },
        ),
        BlocListener<StorageCubit, StorageState>(
          listenWhen: (p,c) => c.success == "File uploaded",
          listener: (context, state) {
            AppSnackbar.showSnackBar(context, state.success, false);
            context.read<StorageCubit>().reset();
            context.read<StorageCubit>().listFiles(id: "TEST ID");
            context.pop();
          },
        ),
      ],
      child: SafeArea(
        child: Apploader(
          isLoading: isLoading,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kBlue)),
                height: 100,
                alignment: Alignment.center,
                child: AppButton(
                  backgroundColor: kBlue,
                  textColor: kWhite,
                  hasIcon: true,
                  icon: Icons.upload_file_rounded,
                  width: size.width,
                  title: selectedFile.path.isNotEmpty
                      ? "File selected"
                      : "Choose a file to upload",
                  disabled: false,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      context.read<StorageCubit>().selectFile(file);
                    } else {
                      // USER CANCELLED
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              AppFormField(
                      hintText: "Enter a file name",
                      onChanged: (value) =>
                          context.read<StorageCubit>().setFileName(value),
                    ),
              const SizedBox(height: 30),
              AppButton(
                backgroundColor: kBlack,
                textColor: kWhite,
                hasIcon: false,
                width: size.width,
                title: "Upload File",
                disabled: selectedFile.path.isEmpty,
                onPressed: () =>
                    context.read<StorageCubit>().uploadFile(id: uid),
              )
            ]),
          )),
        ),
      ),
    ));
  }
}
