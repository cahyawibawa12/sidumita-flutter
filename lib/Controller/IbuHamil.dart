import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Service/IbuHamilService.dart';

class IbuHamilController extends GetxController implements GetxService {
  var listIbuHamil = <IbuHamilModel>[].obs;
  final service = IbuHamilService();
  var isLoading = false.obs;

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
}
