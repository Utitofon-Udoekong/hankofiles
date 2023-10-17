import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/presentation/core/widgets/app_button.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/presentation/core/widgets/app_form_field.dart';
import 'package:hankofiles/presentation/pages/home/widgets/folder_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // primary: false,
        title:
            Text("HankoFiles", style: Theme.of(context).textTheme.titleLarge),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.menu, color: kBlack))
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: AppFormField(hintText: "Search Files"),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: folders.map((folder) {
            return FolderCard(
                color: folder.color,
                title: folder.title,
                createdAt: folder.createdAt,
                onTap: null);
          }).toList(),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: kRed,
            child: const Icon(Icons.add, color: kWhite, size: 30,),
            onPressed: (){
            showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(20),
                      content: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF0905F1))
                        ),
                        height: 250,
                        alignment: Alignment.center,
                        child: AppButton(
                            backgroundColor: const Color(0xFF0905F1),
                            textColor: kWhite,
                            hasIcon: true,
                            icon: Icons.upload_file_rounded,
                            width: size.width,
                            title: "Choose a file to upload",
                            disabled: false,
                            onPressed: ()async{
                              FilePickerResult? result = await FilePicker.platform.pickFiles();
              
                              if (result != null) {
                                File file = File(result.files.single.path!);
                                Uint8List fileBytes = result.files.first.bytes!;
                                context.read<StorageCubit>().selectFile(file);
                              } else {
                                // User canceled the picker
                              }
                            },),
                      ),
                    );
                  });
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FlowFAB extends StatelessWidget {
  final Function uploadFile;
  const FlowFAB(
      {super.key, required this.uploadFile});

  @override
  Widget build(BuildContext context) {
    return SpeedDialFabWidget(
      secondaryIconsList: const [
        Icons.file_upload_rounded,
      ],
      secondaryIconsText: const [
        "Upload a file",
      ],
      secondaryIconsOnPress: [
        uploadFile,
      ],
      secondaryBackgroundColor: kBlack,
      secondaryForegroundColor: kWhite,
      primaryBackgroundColor: kRed,
      primaryForegroundColor: kWhite,
    );
  }
}

class FolderItem {
  final String title;
  final DateTime createdAt;
  final Color color;

  FolderItem({
    required this.title,
    required this.createdAt,
    required this.color,
  });
}

List<FolderItem> folders = <FolderItem>[
  FolderItem(title: "amp3s", createdAt: DateTime.now(), color: Colors.black),
  FolderItem(title: "zuzazu", createdAt: DateTime.now(), color: Colors.red),
  FolderItem(title: "merende", createdAt: DateTime.now(), color: Colors.blue),
  FolderItem(title: "amplico", createdAt: DateTime.now(), color: Colors.green),
  FolderItem(title: "rkrker", createdAt: DateTime.now(), color: Colors.yellow),
  FolderItem(title: "amp3s", createdAt: DateTime.now(), color: Colors.black),
  FolderItem(title: "zuzazu", createdAt: DateTime.now(), color: Colors.red),
  FolderItem(title: "merende", createdAt: DateTime.now(), color: Colors.blue),
  FolderItem(title: "amplico", createdAt: DateTime.now(), color: Colors.green),
  FolderItem(title: "rkrker", createdAt: DateTime.now(), color: Colors.yellow),
];
