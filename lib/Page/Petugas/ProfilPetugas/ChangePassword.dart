import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var petugas = Get.put(PetugasController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String id = '';
  bool _secureText = true;
  bool _secureTextConfirm = true;

  @override
  void initState() {
    super.initState();

    _loadUserData();
  }

  showHideNew() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  showHideConfirm() {
    setState(() {
      _secureTextConfirm = !_secureTextConfirm;
    });
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if (user != null) {
      setState(() {
        id = user['id'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Change Password Petugas"),
            backgroundColor: Color(0xff34BE82),
            leading: BackButton(
              onPressed: () {
                petugas.resetForm();
                Get.back();
              },
            ),
          ),
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.white,
            child: Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: petugas.new_password,
                    maxLength: 20,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      suffixIcon: IconButton(
                        onPressed: showHideNew,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: petugas.confirm_password,
                    validator: (value) {
                      if (value == null) return 'Empty';
                      if (value != petugas.new_password.text)
                        return 'Not Match';
                      return null;
                    },
                    maxLength: 20,
                    obscureText: _secureTextConfirm,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: showHideConfirm,
                        icon: Icon(_secureTextConfirm
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    // onChanged: (value) {},
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        petugas
                            .changePassword(id = id)
                            .then((value) => logout());
                      }
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          )),
        )
      ],
    );
  }

  void logout() async {
    var res = await Network().getData('auth/logout');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LandingLogin()),
          (Route<dynamic> route) => false);
    }
  }
}
