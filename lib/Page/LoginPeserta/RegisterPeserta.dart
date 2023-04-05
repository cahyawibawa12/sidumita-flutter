import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Service/AuthService.dart';
import '../../widget/RoundedButton.dart';

class RegisterPeserta extends StatefulWidget {
  const RegisterPeserta({super.key});

  @override
  State<RegisterPeserta> createState() => _RegisterPesertaState();
}

class _RegisterPesertaState extends State<RegisterPeserta> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  late String name, email, password;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                key: _scaffoldKey,
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
                                      Text(
                                          "Sistem Informasi Ibu Hamil dan Balita"),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(162, 255, 255, 255)),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text('Name'),
                                  TextFormField(
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Full Name",
                                      ),
                                      validator: (nameValue) {
                                        if (nameValue!.isEmpty) {
                                          return 'Please enter your full name';
                                        }
                                        name = nameValue;
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text('Email'),
                                  TextFormField(
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                      ),
                                      validator: (emailValue) {
                                        if (emailValue!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        email = emailValue;
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text("Password"),
                                  TextFormField(
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      obscureText: _secureText,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        suffixIcon: IconButton(
                                          onPressed: showHide,
                                          icon: Icon(_secureText
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                      validator: (passwordValue) {
                                        if (passwordValue!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        password = passwordValue;
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.green),
                                      child: TextButton(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 10),
                                          child: Text(
                                            _isLoading
                                                ? 'Proccessing..'
                                                : 'Register',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _register();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'role_id': 4,
    };

    var res = await Network().auth(data, 'auth/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPagePeserta()),
      );
    } else {
      if (body['message']['name'] != null) {
        _showMsg(body['message']['name'][0].toString());
      } else if (body['message']['email'] != null) {
        _showMsg(body['message']['email'][0].toString());
      } else if (body['message']['password'] != null) {
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
