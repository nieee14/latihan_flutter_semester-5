import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaCtrl;
  late final TextEditingController _alamatCtrl;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.pasien.nama);
    _alamatCtrl = TextEditingController(text: widget.pasien.alamat ?? '');
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien"), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
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
        if (_formKey.currentState!.validate()) {
          final updated = Pasien(
            id: widget.pasien.id,
            nama: _namaCtrl.text,
            alamat: _alamatCtrl.text,
          );
          Navigator.pop(context); // tutup form
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PasienDetail(pasien: updated)),
          );
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}