import 'package:beasiswa/login_page.dart';
import 'package:beasiswa/daftar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _HomePageState();
}

class _HomePageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Beasiswa'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Helvetica',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 110,
              height: 110,
              child: Image.network(
              "https://st.depositphotos.com/1031343/4158/v/450/depositphotos_41584533-stock-illustration-scholarship-stamp.jpg"),
              ),
            const SizedBox(height: 70),
            const Text('Selamat datang di Informasi Beasiswa!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Text('login atau daftar untuk melanjutkan'),
            const SizedBox(height: 100),
            ElevatedButton( 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 214, 233, 248),
                fixedSize: const Size(210, 45),
              ),
              child: const Text('Login'),
              onPressed:  () {
              Get.to(() => const LoginPage());
              }),
            const SizedBox(height: 5),
            ElevatedButton( 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 69, 157, 224),
                fixedSize: Size(210, 45),
              ),
              child: const Text('Daftar',
              style: TextStyle(color: Colors.white),
              ),
              onPressed:  () {
              Get.to(() => const DaftarPage());
              }),
              const SizedBox(height: 10),
            Text('Pusat Bantuan',
            style: TextStyle(color: Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}
