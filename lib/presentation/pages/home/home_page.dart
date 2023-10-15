import 'package:flutter/material.dart';
import 'package:hankofiles/presentation/core/widgets/app_form_field.dart';
import 'package:hankofiles/presentation/pages/home/widgets/folder_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Text("HankoFiles"),
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.menu))],
        bottom: const PreferredSize(preferredSize: Size.fromHeight(50), child: AppFormField(hintText: "Search Folders")),
      ),
      body: SingleChildScrollView(
          child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: folders.map((folder) {
          return FolderCard(color: folder.color, title: folder.title, createdAt: folder.createdAt, onTap: null);
        }).toList(),
      )),
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
