import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/berita.dart';

class BeritaController {
  Future<List<Berita>> muatBerita() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/berita.json');
    final List<dynamic> data = json.decode(jsonString) as List<dynamic>;

    final List<Berita> daftar = data
        .map((e) => Berita.fromJson(e as Map<String, dynamic>))
        .toList();

    daftar.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    return daftar;
  }

  String formatTanggal(String tanggal) {
    const bulan = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    try {
      final parts = tanggal.split('-');
      final tahun = parts[0];
      final bln = bulan[int.parse(parts[1]) - 1];
      final hari = int.parse(parts[2]);
      return '$hari $bln $tahun';
    } catch (_) {
      return tanggal;
    }
  }
}