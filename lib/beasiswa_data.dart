import 'package:flutter/material.dart';

class BeasiswaData extends StatelessWidget {
  const BeasiswaData({super.key});

  void _showBeasiswaDetails(BuildContext context, String beasiswaName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Beasiswa'),
          content: Text('Anda memilih beasiswa $beasiswaName'),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Data Beasiswa
    final List<Map<String, dynamic>> beasiswa = [
      {
        'nama': 'Beasiswa LPDP',
        'lokasi': 'Semua',
        'jenjang': 'S2',
        'fakultas': 'Bisnis',
        'deskripsi': 'Beasiswa untuk studi lanjut dalam dan luar negeri',
      },
      {
        'nama': 'Beasiswa BCA Finance',
        'lokasi': 'Luar Negeri',
        'jenjang': 'S1',
        'fakultas': 'Teknik',
        'deskripsi': 'Beasiswa untuk mahasiswa berprestasi',
      },
      {
        'nama': 'Beasiswa Djarum Plus',
        'lokasi': 'Dalam Negeri',
        'jenjang': 'D3',
        'fakultas': 'Bisnis',
        'deskripsi': 'Beasiswa untuk mahasiswa berprestasi dan aktif berorganisasi',
      },
      {
        'nama': 'Beasiswa UNISBA',
        'lokasi': 'Dalam Negeri',
        'jenjang': 'S1',
        'fakultas': 'Teknik',
        'deskripsi': 'Beasiswa Kuliah di Unisba',
      },
      {
        'nama': 'Beasiswa Pendidikan Indonesia',
        'lokasi': 'Dalam Negeri',
        'jenjang': 'S1',
        'fakultas': 'Bisnis',
        'deskripsi': 'Sudah siap menjadi BPI Awardee 2024?',
      },
      {
        'nama': 'Beasiswa Cendekia Baznas',
        'lokasi': 'Dalam Negeri',
        'jenjang': 'S1',
        'fakultas': 'Teknik',
        'deskripsi': 'Beasiswa untuk mahasiswa di kampus mitra',
      },
      {
        'nama': 'Beasiswa Riau Cerdas',
        'lokasi': 'Luar Negeri',
        'jenjang': 'S2',
        'fakultas': 'Bisnis',
        'deskripsi': 'Beasiswa Provinsi Riau',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Beasiswa'),
      ),
      body: ListView.builder(
        itemCount: beasiswa.length,
        itemBuilder: (context, index) {
          final item = beasiswa[index];
          return ListTile(
            title: Text(item['nama']),
            subtitle: Text(item['deskripsi']),
            onTap: () => _showBeasiswaDetails(context, item['nama']),
          );
        },
      ),
    );
  }
}
