import 'package:flutter/material.dart';
import 'package:flutter_semester5/model/poli.dart';
import 'package:flutter_semester5/service/poli_service.dart';
import 'package:flutter_semester5/ui/poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Tambah Poli"),
       backgroundColor: const Color.fromARGB(255, 65, 124, 233),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [__fieldNamaPoli(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }

  __fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(namaPoli:_namaPoliCtrl.text);
        await PoliService().simpan(poli).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PoliDetail(poli: value)));
        });
      },
      child: const Text("Simpan"));
  }
}