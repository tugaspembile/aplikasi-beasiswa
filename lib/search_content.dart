
import 'package:flutter/material.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({Key? key}) : super
(key: key);

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  String _searchTerm = '';
  String? _selectedLocation;
  String? _selectedJenjang;
  String? _selectedFakultas;

 void _showBeasiswaDetails(BuildContext context, String beasiswaName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail Beasiswa'),
          content: Text('Anda memilih beasiswa $beasiswaName'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> beasiswaList = [
    {
      'nama': 'Beasiswa LPDP',
      'lokasi': 'Dalam Negeri',
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
      'fakultas':
 'Teknik',
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

  List<Map<String, dynamic>> get filteredBeasiswa {
    return beasiswaList.where((beasiswa) {
      final matchSearchTerm = _searchTerm.isEmpty ||
          beasiswa['nama'].toLowerCase().contains(_searchTerm.toLowerCase());
      final matchLocation = _selectedLocation == null ||
          beasiswa['lokasi'] == _selectedLocation;
      final matchJenjang = _selectedJenjang == null ||
          beasiswa['jenjang'] == _selectedJenjang;
      final matchFakultas = _selectedFakultas == null ||
          beasiswa['fakultas'] == _selectedFakultas;
      return matchSearchTerm &&
          matchLocation &&
          matchJenjang &&
          matchFakultas;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari beasiswa...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _searchTerm = text;
                });
              },
            ),
            const SizedBox(height: 20),
            // Filter
            ExpansionTile(
              title: const Text('Filter'),
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Lokasi'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Semua')),
                    DropdownMenuItem(
                        value: 'Dalam Negeri', child: Text('Dalam Negeri')),
                    DropdownMenuItem(
                        value: 'Luar Negeri', child: Text('Luar Negeri')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedLocation = value;
                    });
                  },
                  value: _selectedLocation,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenjang'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Semua')),
                    DropdownMenuItem(value: 'S1', child: Text('S1')),
                    DropdownMenuItem(value: 'S2', child: Text('S2')),
                    DropdownMenuItem(value: 'D3', child: Text('D3')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedJenjang = value;
                    });
                  },
                  value: _selectedJenjang,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Fakultas'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Semua')),
                    DropdownMenuItem(value: 'Bisnis', child: Text('Bisnis')),
                    DropdownMenuItem(value: 'Teknik', child: Text('Teknik')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedFakultas = value;
                    });
                  },
                  value: _selectedFakultas,
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 20),

            // Hasil Pencarian dan Filter
            Expanded(
              child: ListView.builder(
                itemCount: filteredBeasiswa.length,
                itemBuilder: (context, index) {
                  final beasiswa = filteredBeasiswa[index],
                        item = beasiswaList[index];
                  return ListTile(
                    title: Text(beasiswa['nama']),
                    subtitle: Text(
                        'Lokasi: ${beasiswa['lokasi']}, Jenjang: ${beasiswa['jenjang']}, Fakultas: ${beasiswa['fakultas']}'),
                    onTap: () => _showBeasiswaDetails(context, item['nama']),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
