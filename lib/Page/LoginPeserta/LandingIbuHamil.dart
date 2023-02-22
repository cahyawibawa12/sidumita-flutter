import 'package:flutter/material.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/widget/widgets.dart';

class LandingIbuHamil extends StatefulWidget {
  const LandingIbuHamil({super.key});

  @override
  State<LandingIbuHamil> createState() => _LandingIbuHamilState();
}

class _LandingIbuHamilState extends State<LandingIbuHamil> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: <Widget>[
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
                                backgroundImage:
                                    AssetImage('assets/images/bg.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Sistem Informasi Ibu Hamil dan Balita"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(162, 255, 255, 255)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "List Ibu Hamil :",
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  minimumSize: Size(300, 40),
                                ),
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ButtonNavBarIbuHamil()),
                                  );
                                }),
                                child: Text("Bu Wayan",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )))
                          ]),
                    ),
                  ],
                )
              ],
            ),
          )),
        )
      ],
    );
  }
}
