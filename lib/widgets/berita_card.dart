import 'package:flutter/material.dart';
import '../models/berita.dart';

class BeritaCard extends StatelessWidget {
  final Berita berita;
  final String tanggalTampil;
  final VoidCallback onTap;

  const BeritaCard({
    super.key,
    required this.berita,
    required this.tanggalTampil,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool penting = berita.isPenting;

    return Card(
      elevation: penting ? 4 : 1.5,
      margin: EdgeInsets.zero,
      color: penting ? Colors.red.shade50 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: penting ? Colors.red.shade400 : Colors.grey.shade300,
          width: penting ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
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
                          const Icon(Icons.priority_high,
                              size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                        ],
                        Text(
                          berita.kategori,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: penting
                                ? Colors.white
                                : Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (penting)
                    Icon(Icons.campaign,
                        color: Colors.red.shade600, size: 26),
                ],
              ),
              const SizedBox(height: 12),

              Text(
                berita.judul,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: penting ? Colors.red.shade900 : Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_today,
                      size: 14, color: Colors.grey.shade600),
                  const SizedBox(width: 6),
                  Text(
                    tanggalTampil,
                    style: TextStyle(
                        fontSize: 13, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}