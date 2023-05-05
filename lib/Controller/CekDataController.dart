import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/CekDataModel.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/Balita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Service/CekDataService.dart';
import 'package:posyandu/Service/IbuHamilService.dart';

class CekDataController extends GetxController implements GetxService {
  var hasilCekDataBerat = CekDataModel().obs;
  var hasilCekDataTinggi = CekDataModel().obs;
  var hasilCekDataKepala = CekDataModel().obs;
  final service = CekDataService();
  var isLoading = false.obs;

  // void resetButtonClicked() {
  //   Rx<CekDataModel>? hasilCekDataBerat = null;
  //   Rx<CekDataModel>? hasilCekDataTinggi = null;
  //   Rx<CekDataModel>? hasilCekDataKepala = null;
  // }

  Future<void> cekBoys(
      {required int umur,
      required double data_ukur,
      required double data_ukur2,
      required double data_ukur3}) async {
    isLoading.value = true;
    var requestData = CekDataModel(umur: umur, dataUkur: data_ukur);
    var requestData2 = CekDataModel(umur: umur, dataUkur: data_ukur2);
    var requestData3 = CekDataModel(umur: umur, dataUkur: data_ukur3);

    // hasilCekDataBerat = null;
    // hasilCekDataKepala = null;
    // hasilCekDataTinggi = null;

    var response = await service.cekDataBeratBoys(requestData);
    var response2 = await service.cekDataTinggiBoys(requestData2);
    var response3 = await service.cekDataKepalaBoys(requestData3);
    var responsedecode = jsonDecode(response.body);
    var responsedecode2 = jsonDecode(response2.body);
    var responsedecode3 = jsonDecode(response3.body);
    hasilCekDataBerat.value = CekDataModel.fromJson(responsedecode['data']);
    hasilCekDataTinggi.value = CekDataModel.fromJson(responsedecode2['data']);
    hasilCekDataKepala.value = CekDataModel.fromJson(responsedecode3['data']);
    isLoading.value = false;
    // resetButtonClicked();
  }

  Future<void> cekGirls(
      {required int umur,
      required double data_ukur,
      required double data_ukur2,
      required double data_ukur3}) async {
    isLoading.value = true;
    var requestData = CekDataModel(umur: umur, dataUkur: data_ukur);
    var requestData2 = CekDataModel(umur: umur, dataUkur: data_ukur2);
    var requestData3 = CekDataModel(umur: umur, dataUkur: data_ukur3);

    // hasilCekDataBerat = null;
    // hasilCekDataKepala = null;
    // hasilCekDataTinggi = null;

    var response = await service.cekDataBeratGirls(requestData);
    var response2 = await service.cekDataTinggiGirls(requestData2);
    var response3 = await service.cekDataKepalaGirls(requestData3);
    var responsedecode = jsonDecode(response.body);
    var responsedecode2 = jsonDecode(response2.body);
    var responsedecode3 = jsonDecode(response3.body);
    hasilCekDataBerat.value = CekDataModel.fromJson(responsedecode['data']);
    hasilCekDataTinggi.value = CekDataModel.fromJson(responsedecode2['data']);
    hasilCekDataKepala.value = CekDataModel.fromJson(responsedecode3['data']);
    isLoading.value = false;
    // resetButtonClicked();
  }
}
