import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formkey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void dispose() {
    _namaCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _fieldNama(),
              const SizedBox(height: 12),
              _fieldAlamat(),
              const SizedBox(height: 20),
              _tombolSimpan(),
              ],
          ),
        ),
      ),
    );
  }
  Widget _fieldNama() {
     return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
    );
  }
  Widget _fieldAlamat() {
    return TextFormField(
      controller: _alamatCtrl,
      decoration: const InputDecoration(labelText: "Alamat"),
    );
  }
  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          final pasien = Pasien(nama: _namaCtrl.text, alamat: _alamatCtrl.text);
          Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (_) => PasienDetail(pasien: pasien)), 
          );
        }
      },
      child: const Text("Simpan"),
    );
  }
}