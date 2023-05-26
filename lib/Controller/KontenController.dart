import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/KontenModel.dart';
import 'package:posyandu/Service/KontenService.dart';

class KontenController extends GetxController implements GetxService {
  var listKonten = <KontenModel>[].obs;
  final service = KontenService();
  var isLoading = false.obs;

  Future<void> ShowKonten() async {
    isLoading.value = true;
    var response = await service.showKonten();
    var responsedecode = jsonDecode(response.body);
    listKonten.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KontenModel data = KontenModel.fromJson(responsedecode['data'][i]);
      listKonten.add(data);
    }
    isLoading.value = false;
  }
}
