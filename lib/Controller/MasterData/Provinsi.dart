import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/ProvinsiModel.dart';
import 'package:posyandu/Service/MasterData/ProvinsiService.dart';

class ProvinsiController extends GetxController implements GetxService {
  var listProvinsi = <ProvinsiModel>[].obs;
  final service = ProvinsiService();
  var isLoading = false.obs;

  Future<void> getProvinsi() async {
    isLoading.value = true;
    var response = await service.showProvinsi();
    var responsedecode = jsonDecode(response.body);
    listProvinsi.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      ProvinsiModel provinsiModel =
          ProvinsiModel.fromJson(responsedecode['data'][i]);
      listProvinsi.add(provinsiModel);
    }
    isLoading.value = false;
  }
}
