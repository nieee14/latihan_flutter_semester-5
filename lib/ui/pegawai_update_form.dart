import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaCtrl;
  late final TextEditingController _jabatanCtrl;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.pegawai.nama);
    _jabatanCtrl = TextEditingController(text: widget.pegawai.jabatan ?? '');
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _jabatanCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _fieldNama(),
                const SizedBox(height: 12),
                _fieldJabatan(),
                const SizedBox(height: 20),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
    );
  }

  Widget _fieldJabatan() {
    return TextFormField(
      controller: _jabatanCtrl,
      decoration: const InputDecoration(labelText: "Jabatan (opsional)"),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final updated = Pegawai(
            id: widget.pegawai.id,
            nama: _namaCtrl.text,
            jabatan: _jabatanCtrl.text,
          );
          Navigator.pop(context); // tutup form
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PegawaiDetail(pegawai: updated)),
          );
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}