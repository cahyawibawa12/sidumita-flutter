import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/KecamatanModel.dart';
import 'package:posyandu/Service/MasterData/KecamatanService.dart';

class KecamatanController extends GetxController implements GetxService {
  var listKecamatan = <KecamatanModel>[].obs;
  final service = KecamatanService();
  var isLoading = false.obs;

  Future<void> getKecamatan() async {
    isLoading.value = true;
    var response = await service.showKecamatan();
    var responsedecode = jsonDecode(response.body);
    listKecamatan.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KecamatanModel kecamatanModel =
          KecamatanModel.fromJson(responsedecode['data'][i]);
      listKecamatan.add(kecamatanModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchKabupaten({required int? kabupaten_id}) async {
    isLoading.value = true;

    var kabupaten = KecamatanModel(kabupatenId: kabupaten_id);

    var response = await service.fecthKabupaten(kabupaten);
    var responsedecode = jsonDecode(response.body);
    listKecamatan.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KecamatanModel kecamatanModel =
          KecamatanModel.fromJson(responsedecode['data'][i]);
      listKecamatan.add(kecamatanModel);
    }
    isLoading.value = false;
  }
}
