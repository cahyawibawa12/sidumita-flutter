import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DusunController.dart';
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
  String? name, email, password, no_kk, alamat;
  String? dusun_id;
  var listDusun = Get.put(DusunController());

  @override
  void initState() {
    super.initState();
    listDusun.getDusun();
  }

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
                          Obx(
                            () => listDusun.isLoading.value
                                ? CircularProgressIndicator()
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    margin: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(162, 255, 255, 255)),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text('Nama Kepala Keluarga'),
                                          TextFormField(
                                              cursorColor: Colors.blue,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText: "I Nyoman Cahya",
                                              ),
                                              validator: (nameValue) {
                                                if (nameValue!.isEmpty) {
                                                  return 'Mohon masukan nama lengkap anda';
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
                                                hintText: "cahya@gmail.com",
                                              ),
                                              validator: (emailValue) {
                                                if (emailValue!.isEmpty) {
                                                  return 'Mohon masukan email';
                                                }
                                                email = emailValue;
                                                return null;
                                              }),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text('Nomor Kartu Keluarga'),
                                          TextFormField(
                                              cursorColor: Colors.blue,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText: "5012...",
                                              ),
                                              validator: (noKKValue) {
                                                if (noKKValue!.isEmpty) {
                                                  return 'Mohon input nomor kartu keluarga anda';
                                                }
                                                no_kk = noKKValue;
                                                return null;
                                              }),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text('Alamat'),
                                          TextFormField(
                                              cursorColor: Colors.blue,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Jl. Doang Jadian Kagak",
                                              ),
                                              validator: (alamatValue) {
                                                if (alamatValue!.isEmpty) {
                                                  return 'Mohon input alamat anda';
                                                }
                                                alamat = alamatValue;
                                                return null;
                                              }),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          LayoutBuilder(
                                              builder: (context, constraint) {
                                            return FormField(
                                              initialValue: false,
                                              enabled: true,
                                              builder:
                                                  (FormFieldState<bool> field) {
                                                return InputDecorator(
                                                  decoration: InputDecoration(
                                                    labelText: "Dusun",
                                                    errorText: field.errorText,
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: ButtonTheme(
                                                      alignedDropdown: false,
                                                      child: DropdownButton<
                                                              String>(
                                                          isExpanded: true,
                                                          value:
                                                              dusun_id == null
                                                                  ? null
                                                                  : dusun_id,
                                                          icon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        10.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_down_outlined,
                                                              size: 24.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .color,
                                                            ),
                                                          ),
                                                          iconSize: 16,
                                                          elevation: 16,
                                                          style: TextStyle(
                                                            fontSize: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .fontSize,
                                                            fontFamily:
                                                                Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .fontFamily,
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .color,
                                                          ),
                                                          underline: Container(
                                                            height: 0,
                                                            color: Colors
                                                                .grey[300],
                                                          ),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              dusun_id =
                                                                  newValue!;
                                                            });
                                                          },
                                                          items: [
                                                            for (var data
                                                                in listDusun
                                                                    .listDusun
                                                                    .value)
                                                              DropdownMenuItem(
                                                                child: new Text(
                                                                  data.namaDusun!,
                                                                ),
                                                                value: data.id
                                                                    .toString(),
                                                              )
                                                          ]),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                          Text("Password"),
                                          TextFormField(
                                              cursorColor: Colors.blue,
                                              keyboardType: TextInputType.text,
                                              obscureText: _secureText,
                                              decoration: InputDecoration(
                                                hintText: "xCahya.",
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
                                                      horizontal: 18,
                                                      vertical: 10),
                                                  child: Text(
                                                    _isLoading
                                                        ? 'Proccessing..'
                                                        : 'Register',
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                          )
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
      'kepala_keluarga': name,
      'email': email,
      'no_kartu_keluarga': no_kk,
      'password': password,
      'alamat': alamat,
      'dusun_id': dusun_id,
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
      // if (body['message']['name'] != null) {
      //   _showMsg(body['message']['name'][0].toString());
      // } else if (body['message']['email'] != null) {
      //   _showMsg(body['message']['email'][0].toString());
      // } else if (body['message']['password'] != null) {
      //   _showMsg(body['message']['password'][0].toString());
      // }
      Get.snackbar(
        'Nomor Kartu Keluarga Sudah Terdaftar',
        "Mohon coba melakukan login dengan email yang terdaftar",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
