import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Text("HankoFiles"),
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
          child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          
        ],
      )),
    );
  }
}
