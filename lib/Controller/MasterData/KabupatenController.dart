import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/KabupatenModel.dart';
import 'package:posyandu/Model/MasterData/ProvinsiModel.dart';
import 'package:posyandu/Service/MasterData/KabupatenService.dart';

class KabupatenController extends GetxController implements GetxService {
  var listKabupaten = <KabupatenModel>[].obs;
  final service = KabupatenService();
  var isLoading = false.obs;

  Future<void> getKabupaten() async {
    isLoading.value = true;
    var response = await service.showKabupaten();
    var responsedecode = jsonDecode(response.body);
    listKabupaten.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KabupatenModel kabupatenModel =
          KabupatenModel.fromJson(responsedecode['data'][i]);
      listKabupaten.add(kabupatenModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchProvinsi({required int? provinsi_id}) async {
    isLoading.value = true;

    var provinsi = KabupatenModel(provinsiId: provinsi_id);

    var response = await service.fecthProvinsi(provinsi);
    var responsedecode = jsonDecode(response.body);
    listKabupaten.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KabupatenModel kabupatenModel =
          KabupatenModel.fromJson(responsedecode['data'][i]);
      listKabupaten.add(kabupatenModel);
    }
    isLoading.value = false;
  }
}
