import 'package:flutter/material.dart';
import 'package:flutter_semester5/ui/pasien_item.dart';
import '../widget/sidebar.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          PasienItem(pasien: Pasien(nama: "Andi", alamat: "Jl. Melati")),
          PasienItem(pasien: Pasien(nama: "Rina", alamat: "Jl. Mawar")),
          PasienItem(pasien: Pasien(nama: "Budi", alamat: "Jl. Kenanga")),
          PasienItem(pasien: Pasien(nama: "Sari", alamat: "Jl. Anggrek")),
        ],
      ),
    );
  }
}