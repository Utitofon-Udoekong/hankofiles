import 'package:flutter/material.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:jiffy/jiffy.dart';

class FolderCard extends StatelessWidget {
  final Color color;
  final String title;
  final String createdAt;
  final String mimeType;
  final void Function()? downloadFile;
  final void Function()? onLongPress;
  final void Function()? onTap;
  const FolderCard(
      {super.key,
      required this.mimeType,
      required this.color,
      required this.title,
      required this.createdAt,
      this.downloadFile,
      this.onLongPress, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: color.withOpacity(0.1),
        selectedTileColor: kBlue,
        onLongPress: onLongPress,
        onTap: onTap,
        leading: Icon(getIconDataFromMimeType(mimeType), color: color),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          Jiffy.parseFromDateTime(getDateTimeFromISO8601String(createdAt))
              .yMMMMd,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: downloadFile,
                child: const ListTile(title: Text("Download file")),
              ),
            ];
          },
        ));
  }
}
