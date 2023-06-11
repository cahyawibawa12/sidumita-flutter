import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class EmailVerifPage extends StatefulWidget {
  const EmailVerifPage({super.key});

  @override
  State<EmailVerifPage> createState() => _EmailVerifPageState();
}

class _EmailVerifPageState extends State<EmailVerifPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: Text("Change Password Peserta"),
          //   backgroundColor: Color(0xff34BE82),

          // ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/Logo.png'),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "SIDUMITA",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "Sistem Informasi Posyandu Ibu Hamil dan Balita",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(162, 255, 255, 255)),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "Silahkan Cek Email Anda untuk Melakukan Reset Password",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
                                child: TextButton(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    child: Text(
                                      'Kembali ke Halaman Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LandingLogin()));
                                  },
                                ),
                              ),
                            ),
                          ]),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
