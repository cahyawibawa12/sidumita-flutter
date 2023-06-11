import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/ResetPasswordmodel.dart';
import 'package:posyandu/Page/EmailVerifPage.dart';
import 'package:posyandu/Service/ResetPasswordService.dart';

class ResetPasswordController extends GetxController implements GetxService {
  final service = ResetPasswordService();
  var resetPass = ResetPasswordModel().obs;
  var isLoading = false.obs;
  TextEditingController email_controller = TextEditingController();

  Future<void> resetPassword() async {
    isLoading.value = true;

    // resetPass.value.email = email_controller.text;
    var data = {'email': email_controller.text};

    var response = await service.ResetPassword(data);
    var responsedecode = jsonDecode(response.body);

    if (response.statusCode == 200) {
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
}
