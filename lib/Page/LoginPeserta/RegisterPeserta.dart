import 'package:flutter/material.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

import '../../widget/RoundedButton.dart';

class RegisterPeserta extends StatefulWidget {
  const RegisterPeserta({super.key});

  @override
  State<RegisterPeserta> createState() => _RegisterPesertaState();
}

class _RegisterPesertaState extends State<RegisterPeserta> {
  String _username = '';
  String _password = '';
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
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Email'),
                            TextField(
                              // decoration: const InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                _username = value;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text("Password"),
                            TextField(
                              obscureText: true,
                              // decoration:
                              //     const InputDecoration(hintText: 'password'),
                              onChanged: (value) {
                                _password = value;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RoundedButton(
                              btnText: 'REGISTER',
                              onBtnPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPagePeserta()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )))
      ],
    );
  }
}
