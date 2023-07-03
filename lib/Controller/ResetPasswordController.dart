import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/ResetPasswordmodel.dart';
import 'package:posyandu/Page/EmailVerifPage.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/ResetPassword.dart';
import 'package:posyandu/Service/ResetPasswordService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordController extends GetxController implements GetxService {
  final service = ResetPasswordService();
  var resetPass = ResetPasswordModel().obs;
  var isLoading = false.obs;
  TextEditingController email_controller = TextEditingController();
  TextEditingController new_password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  Future<void> sendEmail() async {
    isLoading.value = true;

    // resetPass.value.email = email_controller.text;
    var data = {'email': email_controller.text};

    var response = await service.SendEmailOTP(data);
    var responsedecode = jsonDecode(response.body);

    if (responsedecode['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('email', responsedecode['email']);
      Get.to(EmailVerifPage());

      Get.snackbar(
        'Email Dikirim',
        "Periksa Email Anda",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    } else {
      Get.snackbar(
        'Email Salah',
        "Mohon Masukan Email yang Benar",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    isLoading.value = false;
  }

  Future<void> verifOtp(String verifotp) async {
    isLoading.value = true;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var email = localStorage.getString('email')?.replaceAll('"', "") ?? '';

    // resetPass.value.email = email_controller.text;
    var data = {'email': email, 'otp': verifotp};

    var response = await service.VerifOtp(data);
    var responsedecode = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.to(ResetPassword());
      Get.snackbar(
        'Perbaharui Password',
        "Masukkan Password baru anda",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    } else {
      Get.snackbar(
        'OTP Salah',
        "Mohon Masukkan OTP yang Benar",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    isLoading.value = false;
  }

  Future<void> resetPassword() async {
    isLoading.value = true;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var email = localStorage.getString('email')?.replaceAll('"', "") ?? '';

    email_controller.text = email.toString();
    // resetPass.value.email = email_controller.text;
    var data = {'email': email, 'password': new_password.text};

    var response = await service.resetPassword(data);
    var responsedecode = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.to(LandingLogin());
      Get.snackbar(
        'Perbaharui Password Berhasil',
        "Masukkan Password baru anda",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
      new_password.clear();
    } else {
      Get.snackbar(
        'Gagal Perbaharui Password',
        "Mohon Masukkan Data yang Benar",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    isLoading.value = false;
  }
}
