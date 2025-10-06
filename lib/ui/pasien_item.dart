import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  
  const PasienItem ({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PasienDetail(pasien: pasien)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        elevation: 2,
        child: ListTile(
          title: Text(
            pasien.nama,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(pasien.alamat ?? '_'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
} 