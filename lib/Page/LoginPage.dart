import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/HomePageBalita.dart';
import 'package:posyandu/Page/LandingPage.dart';
import 'package:posyandu/Page/LupaPassPage.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:posyandu/globals.dart';
import 'package:posyandu/AuthService.dart';
import 'package:http/http.dart' as http;

import '../widget/BackgroundImage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      print(response.statusCode);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ButtonNavBarBalita(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

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
                              _email = value;
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
                            btnText: 'LOGIN',
                            onBtnPressed: () => loginPressed(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LupaPassPage()));
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontStyle: FontStyle.normal),
                                )),
                          ),
                        ],
                      ),
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
