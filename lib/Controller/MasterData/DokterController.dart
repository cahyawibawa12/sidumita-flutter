import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/DokterModel.dart';
import 'package:posyandu/Service/MasterData/DokterService.dart';

class DokterController extends GetxController implements GetxService {
  var listDokter = <DokterModel>[].obs;
  final service = DokterService();
  var isLoading = false.obs;

  Future<void> getDokter() async {
    isLoading.value = true;
    var response = await service.showDokter();
    var responsedecode = jsonDecode(response.body);
    listDokter.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DokterModel dokterModel = DokterModel.fromJson(responsedecode['data'][i]);
      listDokter.add(dokterModel);
    }
    isLoading.value = false;
  }
}
