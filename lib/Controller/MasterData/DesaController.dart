import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/DesaModel.dart';
import 'package:posyandu/Service/MasterData/DesaService.dart';

class DesaController extends GetxController implements GetxService {
  var listDesa = <DesaModel>[].obs;
  final service = DesaService();
  var isLoading = false.obs;

  Future<void> getDesa() async {
    isLoading.value = true;
    var response = await service.showDesa();
    var responsedecode = jsonDecode(response.body);
    listDesa.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DesaModel desaModel = DesaModel.fromJson(responsedecode['data'][i]);
      listDesa.add(desaModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchKecamatan({required int? kecamatan_id}) async {
    isLoading.value = true;

    var kecamatan = DesaModel(kecamatanId: kecamatan_id);

    var response = await service.fecthKecamatan(kecamatan);
    var responsedecode = jsonDecode(response.body);
    listDesa.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DesaModel desaModel = DesaModel.fromJson(responsedecode['data'][i]);
      listDesa.add(desaModel);
    }
    isLoading.value = false;
  }
}
