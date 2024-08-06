import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ColoredBox(color: Colors.cyan)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nama Mahasiswa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica',
                ),
              ),
              const Text(
                'Mahasiswa@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Helvetica',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const CustomListTile(
                title: "Edit Profil",
                icon: Icons.person,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const CustomListTile(
                title: "Sejarah Beasiswa",
                icon: Icons.history,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const CustomListTile(
                title: "Logout",
                icon: Icons.logout,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomListTile({required this.title, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

void main() => runApp( MaterialApp(home: ProfileContent()));
