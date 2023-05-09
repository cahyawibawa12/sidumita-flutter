import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';

import 'package:posyandu/Service/IbuHamilService.dart';

class IbuHamilController extends GetxController implements GetxService {
  var listIbuHamil = <IbuHamilModel>[].obs;
  var updateIbu = IbuHamilModel().obs;
  final service = IbuHamilService();
  var isLoading = false.obs;

  TextEditingController tinggi_pra = TextEditingController();
  TextEditingController berat_pra = TextEditingController();

  Future<void> ShowIbuHamil() async {
    isLoading.value = true;
    var response = await service.showMyIbuHamils();
    var responsedecode = jsonDecode(response.body);
    listIbuHamil.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      IbuHamilModel data = IbuHamilModel.fromJson(responsedecode['data'][i]);
      listIbuHamil.add(data);
    }
    isLoading.value = false;
  }

  Future<void> UpdateIbuHamil(int id) async {
    isLoading.value = true;
    updateIbu.value.id = id;
    updateIbu.value.beratBadanPrakehamilan = berat_pra.text;
    updateIbu.value.tinggiBadanPrakehamilan = tinggi_pra.text;

    var response = await service.updateMyIbuHamils(
      updateIbu.value,
    );
    var responsedecode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar(
        'Update Berhasil',
        "Data berhasil diubah",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    } else {
      Get.snackbar(
        'Update Gagal',
        "Data gagal diubah, mohon periksa kembali",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    isLoading.value = false;
  }
}
