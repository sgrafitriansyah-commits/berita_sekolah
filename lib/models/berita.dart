class Berita {
  final int id;
  final String judul;
  final String tanggal;
  final String kategori;
  final String isi;

  Berita({
    required this.id,
    required this.judul,
    required this.tanggal,
    required this.kategori,
    required this.isi,
  });

  bool get isPenting => kategori.toLowerCase() == 'penting';
  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'] as int,
      judul: json['judul'] as String,
      tanggal: json['tanggal'] as String,
      kategori: json['kategori'] as String,
      isi: json['isi'] as String,
    );
  }
} 