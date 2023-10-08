import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  final Color color;
  final String title;
  final DateTime dateCreated;
  final void Function()? onpressed;
  const FolderCard(
      {super.key,
      required this.color,
      required this.title,
      required this.dateCreated,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        color: color.withOpacity(0.1),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.folder_rounded, color: color,),
            const SizedBox(height: 20,),
            Text(title),
            Text(dateCreated.toIso8601String())
          ],
        ),
      ),
    );
  }
}
