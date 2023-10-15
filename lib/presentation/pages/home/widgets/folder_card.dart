import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class FolderCard extends StatelessWidget {
  final Color color;
  final String title;
  final DateTime createdAt;
  final void Function()? onTap;
  const FolderCard({super.key, required this.color, required this.title, required this.createdAt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.folder_rounded, color: color,),
            const SizedBox(
              height: 20
            ),
            Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),),
            const SizedBox(
              height: 8
            ),
            Text(Jiffy.parseFromDateTime(createdAt).yMMMMd, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),),
          ],
        ),
      ),
    );
  }
}