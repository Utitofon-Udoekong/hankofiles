import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: kBlack.withOpacity(0.1),
      child: Column(
        children: [
          const DrawerHeader(child: CircleAvatar(backgroundColor: kPrimary, radius: 50,)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.push("/storage"),
                child: const Text("Storage"),
              )
            ]
          )
        ]
      ),
    );
  }
}