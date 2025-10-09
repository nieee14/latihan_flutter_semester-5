import 'package:flutter/material.dart';
import 'package:flutter_semester5/helpers/user_info.dart';
import 'ui/beranda.dart';
import 'ui/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // biar bisa dipanggil const di test

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Klinik APP",
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: UserInfo().getToken(),
        builder: (context, snap) {
          // Saat loading, tampilkan splash sederhana
          if (snap.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final token = snap.data;
          return token == null ? const Login() : const Beranda();
        },
      ),
    );
  }
}
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Klinik APP',
//       debugShowCheckedModeBanner: false,
//       home: Beranda(),
//     );
//   }
// }