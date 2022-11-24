import 'package:flutter/material.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class HomePageBalita extends StatefulWidget {
  const HomePageBalita({super.key});

  @override
  State<HomePageBalita> createState() => _HomePageBalitaState();
}

class _HomePageBalitaState extends State<HomePageBalita> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/bg.png'),
                      ),
                      Column(
                        children: [
                          Text(
                            "Putu Nyoman",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "0 Tahun 6 Bulan",
                            textAlign: TextAlign.start,
                            // style: Padding(padding: EdgeInsets.only(left: 10)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )),
        )
      ],
    );
  }
}
