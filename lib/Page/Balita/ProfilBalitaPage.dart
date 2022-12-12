import 'package:flutter/material.dart';
import 'package:posyandu/widget/widgets.dart';

class ProfilBalitaPage extends StatefulWidget {
  const ProfilBalitaPage({super.key});

  @override
  State<ProfilBalitaPage> createState() => _ProfilBalitaPageState();
}

class _ProfilBalitaPageState extends State<ProfilBalitaPage> {
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
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/images/bg.png'),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            margin: EdgeInsets.only(left: 20),
                            child: Center(
                              child: Text(
                                "Putu Nyoman",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
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
