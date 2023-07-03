import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/ResetPasswordController.dart';
import 'package:posyandu/Page/EmailVerifPage.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class LupaPassPage extends StatefulWidget {
  const LupaPassPage({super.key});

  @override
  State<LupaPassPage> createState() => _LupaPassPageState();
}

class _LupaPassPageState extends State<LupaPassPage> {
  var resetPassword = Get.put(ResetPasswordController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  void initState() {
    super.initState();
    resetPassword.email_controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: Text("Change Password Peserta"),
          //   backgroundColor: Color(0xff34BE82),

          // ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(() => resetPassword.isLoading.value
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 3),
                          Text(
                            "Processing...",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
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
                                backgroundImage:
                                    AssetImage('assets/images/Logo.png'),
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
                                  style: TextStyle(fontSize: 11),
                                ),
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
                              key: _form,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                        // hint:'admin@gmail.com',
                                        // maxLength: 20,
                                        controller:
                                            resetPassword.email_controller,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                          ),
                                          suffixIcon: Icon(
                                            Icons.email,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          // helperText: 'Enter your email address',
                                        ),
                                        validator: (nameValue) {
                                          if (nameValue!.isEmpty) {
                                            return 'Mohon masukan email anda';
                                          }
                                          resetPassword.email_controller.text =
                                              nameValue;
                                          return null;
                                        }
                                        // onChanged: (value) {},
                                        ),
                                    SizedBox(
                                      height: 20,
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
                                                horizontal: 50, vertical: 10),
                                            child: Text(
                                              resetPassword.isLoading.value
                                                  ? 'Proccessing..'
                                                  : 'Submit',
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
                                            if (_form.currentState!
                                                .validate()) {
                                              resetPassword.sendEmail();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                            )),
                      ],
                    )),
            ),
          ),
        )
      ],
    );
  }
}
