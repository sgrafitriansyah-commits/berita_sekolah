import 'package:flutter/material.dart';
import '../models/berita.dart';

class HalamanDetail extends StatelessWidget {
  final Berita berita;
  final String tanggalTampil;

  const HalamanDetail({
    super.key,
    required this.berita,
    required this.tanggalTampil,
  });

  @override
  Widget build(BuildContext context) {
    final bool penting = berita.isPenting;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Detail Berita'),
        backgroundColor: penting ? Colors.pink.shade600 : Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: penting ? Colors.red.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: penting ? Colors.red.shade400 : Colors.grey.shade300,
                  width: penting ? 2 : 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: penting
                          ? Colors.red.shade600
                          : Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (penting) ...[
                          const Icon(Icons.campaign,
                              size: 16, color: Colors.white),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          berita.kategori,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: penting
                                ? Colors.white
                                : Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    berita.judul,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Text(
                        tanggalTampil,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  const Divider(height: 32),

                  Text(
                    berita.isi,
                    style: const TextStyle(fontSize: 16, height: 1.7),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}