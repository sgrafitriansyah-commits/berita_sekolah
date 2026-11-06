import 'package:flutter/material.dart';
import 'views/halaman_utama.dart';

void main() {
  runApp(const BeritaSekolahApp());
}

class BeritaSekolahApp extends StatelessWidget {
  const BeritaSekolahApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Berita Sekolah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}