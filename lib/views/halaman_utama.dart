import 'package:flutter/material.dart';
import '../controllers/berita_controller.dart';
import '../models/berita.dart';
import '../widgets/berita_card.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final BeritaController _controller = BeritaController();
  late Future<List<Berita>> _futureBerita;

  @override
  void initState() {
    super.initState();
    _futureBerita = _controller.muatBerita();
  }

  void _bukaDetail(Berita berita) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanDetail(
          berita: berita,
          tanggalTampil: _controller.formatTanggal(berita.tanggal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Berita Sekolah'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.school),
      ),
      body: FutureBuilder<List<Berita>>(
        future: _futureBerita,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          }
          final daftar = snapshot.data ?? [];
          if (daftar.isEmpty) {
            return const Center(child: Text('Belum ada berita.'));
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final double lebar = constraints.maxWidth;

              if (lebar < 700) {
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: daftar.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) => BeritaCard(
                    berita: daftar[i],
                    tanggalTampil:
                        _controller.formatTanggal(daftar[i].tanggal),
                    onTap: () => _bukaDetail(daftar[i]),
                  ),
                );
              }

              final int kolom = lebar >= 1000 ? 3 : 2;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: daftar.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kolom,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 170, 
                    ),
                    itemBuilder: (context, i) => BeritaCard(
                      berita: daftar[i],
                      tanggalTampil:
                          _controller.formatTanggal(daftar[i].tanggal),
                      onTap: () => _bukaDetail(daftar[i]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}