import 'package:flutter/material.dart';
import 'package:flutter_semester5/ui/pegawai_item.dart';
import '../widget/sidebar.dart';
import '../model/pegawai.dart'; // pastikan huruf kecil, sesuai nama file model
import 'pegawai_detail.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"), // ubah dari 'Data Poli' → 'Data Pegawai'
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiForm()),
              );
            },
          ),
        ],
      ),
     body: ListView(
  children: [
    PegawaiItem(pegawai: Pegawai(nama: "Andre", jabatan: "Perawat")),
    PegawaiItem(pegawai: Pegawai(nama: "Rangga", jabatan: "Kasir")),
    PegawaiItem(pegawai: Pegawai(nama: "Suswanto", jabatan: "Dokter")),
    PegawaiItem(pegawai: Pegawai(nama: "Najariyah", jabatan: "Admin")),
  ],
),
    );
  }
}