import 'package:flutter/material.dart';

class BeasiswaPage extends StatelessWidget {
  const BeasiswaPage({
    super.key,
    required this.beasiswaList,
  });

  final List<Map<String, dynamic>> beasiswaList;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Beasiswa'),
      ),
      body: ListView.builder(
        itemCount: beasiswaList.length,
        itemBuilder: (context, index) {
          final item = beasiswaList[index];
          return ListTile(
            title: Text(item['nama']),
            subtitle: Text(
                'Lokasi: ${item['lokasi']}, Jenjang: ${item['jenjang']}, Fakultas: ${item['fakultas']}'),
            onTap: () => _showBeasiswaDetails(context, item['nama']),
          );
        },
      ),
    );
  }
}
