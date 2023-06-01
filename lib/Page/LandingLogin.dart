import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Page/IbuHamil/ProfilIbuHamilPage.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/Page/LoginPetugas/LoginPagePetugas.dart';

import '../widget/widgets.dart';

class LandingLogin extends StatefulWidget {
  const LandingLogin({super.key});

  @override
  State<LandingLogin> createState() => _LandingLoginState();
}

class _LandingLoginState extends State<LandingLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            Column(children: <Widget>[
              Column(
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
                          radius: 55,
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
                          Text("Sistem Informasi Ibu Hamil dan Balita"),
                        ],
                      )
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apakah Kamu?",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(300, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPagePetugas()),
                              );
                            }),
                            child: Text("Petugas Kesehatan",
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(300, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPagePeserta()),
                              );
                            }),
                            child: Text("Peserta",
                                style: TextStyle(
                                  color: Colors.black,
                                )))
                      ]))
            ])
          ]))))
    ]);
  }
}
