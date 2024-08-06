import 'package:beasiswa/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<DaftarPage> {
  TextEditingController emailController = TextEditingController();
  String label1 = 'Masukan Email';
  TextEditingController usernameController = TextEditingController();
  String label = 'Masukan Username';
  TextEditingController passwordController = TextEditingController();
  String label2 = 'Masukan Password';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SILAHKAN MENDAFTAR'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Helvetica',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 110,
              height: 110,
              child: 
                Image.network("https://st.depositphotos.com/1031343/4158/v/450/depositphotos_41584533-stock-illustration-scholarship-stamp.jpg"),
            ),SizedBox(height: 10),
             TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),),
                hintText: 'Masukan Email',
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),),
                hintText: 'Masukan Username',
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),),
                hintText: 'Masukan Password',
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton( 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 69, 157, 224),
                fixedSize: Size(150, 40),),
              child: Text('DAFTAR',
              style: TextStyle(color: Colors.white),
              ),
              onPressed:  () {
              Get.to(() => HomePage());
              }),
            Text('Lupa Password?',
              style: TextStyle(color: Colors.blue[900]),
            ),  
          ],
        ),
      )
    );
  }
}