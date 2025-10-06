import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Beranda"),
      backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}