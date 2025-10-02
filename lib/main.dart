import 'package:flutter/material.dart';
import './ui/poli_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelesWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      home: PoliPage(),
    );
  }
}