import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Service/BalitaService.dart';

class BalitaController extends GetxController implements GetxService {
  var listBalita = <BalitaModel>[].obs;
  final service = BalitaService();
  var isLoading = false.obs;

  Future<void> ShowBalita() async {
    isLoading.value = true;
    var response = await service.showMyBalitas();
    var responsedecode = jsonDecode(response.body);
    listBalita.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      BalitaModel data = BalitaModel.fromJson(responsedecode['data'][i]);
      listBalita.add(data);
    }
    isLoading.value = false;
  }
}
