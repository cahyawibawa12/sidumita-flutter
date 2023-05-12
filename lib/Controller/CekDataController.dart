import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/CekDataModel.dart';
import 'package:posyandu/Model/DataBeratIbu.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Model/StatusBeratIbuModel.dart';
import 'package:posyandu/Page/Balita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Service/CekDataService.dart';
import 'package:posyandu/Service/IbuHamilService.dart';

class CekDataController extends GetxController implements GetxService {
  var hasilCekDataBerat = CekDataModel().obs;
  var hasilCekDataTinggi = CekDataModel().obs;
  var hasilCekDataKepala = CekDataModel().obs;
  var hasilBeratIbu = <DataBeratIbuModel>[].obs;
  var hasilStatusBeratIbu = StatusBeratIbuModel().obs;
  final service = CekDataService();
  var isLoading = false.obs;
  List<Map<dynamic, dynamic>> data = [];

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

  Future<void> getBeratIbu(int ibu_hamil_id) async {
    isLoading.value = true;
    var response = await service.getBeratIbu(ibu_hamil_id);
    var responsedecode = jsonDecode(response.body);

    // for (var i = 0; i < responsedecode['data'].length; i++) {
    //   DataBeratIbuModel data =
    //       DataBeratIbuModel.fromJson(responsedecode['data'][i]);
    //   hasilBeratIbu.add(data);
    // }
    // hasilBeratIbu.value = DataBeratIbuModel.fromJson(responsedecode['data']);

    Map obj = responsedecode;
    data = List<Map<dynamic, dynamic>>.from(obj["data"]);

    isLoading.value = false;
  }

  Future<void> statusBeratIbu({required int ibu_hamil_id}) async {
    isLoading.value = true;

    var request = StatusBeratIbuModel(id: ibu_hamil_id);

    var response = await service.statusBeratIbu(request);
    var responsedecode = jsonDecode(response.body);

    hasilStatusBeratIbu.value =
        StatusBeratIbuModel.fromJson(responsedecode["data"]);

    isLoading.value = false;
  }
}
