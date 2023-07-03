import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/ResetPasswordController.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/RoundedButton.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var reset_passwordOTPcontroller = Get.put(ResetPasswordController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _secureText = true;
  bool _secureTextConfirm = true;
  String? email;

  @override
  void initState() {
    super.initState();
  }
// _loadUserData() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var email = jsonDecode(localStorage.getString('email')!);

//     if (email != null) {
//       setState(() {
//         email = email.toString();
//       });
//     }
//   }
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            readOnly: true,
                            controller:
                                reset_passwordOTPcontroller.email_controller,

                            // obscureText: _secureText,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                            // onChanged: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller:
                                  reset_passwordOTPcontroller.new_password,
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
                              validator: (passwordValue) {
                                if (passwordValue!.isEmpty) {
                                  return 'Mohon inputkan password anda';
                                } else if (passwordValue.length < 8) {
                                  return 'Mohon input password minimal 8 karakter';
                                }
                                reset_passwordOTPcontroller.new_password.text =
                                    passwordValue;
                                return null;
                              }
                              // onChanged: (value) {},
                              ),
                          TextFormField(
                            controller:
                                reset_passwordOTPcontroller.confirm_password,
                            validator: (nameValue) {
                              if (nameValue == null) return 'Empty';
                              if (nameValue !=
                                  reset_passwordOTPcontroller.new_password.text)
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
                                    'Submit',
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
                                  if (_form.currentState!.validate()) {
                                    reset_passwordOTPcontroller.resetPassword();
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
