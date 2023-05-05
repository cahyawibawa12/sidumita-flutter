import 'dart:convert';

import 'package:get/get.dart';

import '../Model/GetTwoLastDataPemeriksaanIbuHamilModel.dart';
import '../Service/GetTwoLastDataPemeriksaanIbuHamilService.dart';

class GetTwoLastDataPemeriksaanIbuHamilController extends GetxController
    implements GetxService {
  var listTwoLastDataPemeriksaanIbuHamil =
      <GetTwoLastDataPemeriksaanIbuHamilModel>[].obs;
  final service = GetTwoLastDataPemeriksaanIbuHamilService();

  Future<void> getTwoLastDataPemeriksaanIbuHamil(int ibu_hamil_id) async {
    var response = await service.twolastdatapemeriksaanibuhamil(ibu_hamil_id);
    var responsedecode = jsonDecode(response.body);
    listTwoLastDataPemeriksaanIbuHamil.clear();

    for (var i = 0; i < responsedecode['data'].length; i++) {
      GetTwoLastDataPemeriksaanIbuHamilModel
          twoLastDataPemeriksaanIbuHamilModel =
          GetTwoLastDataPemeriksaanIbuHamilModel(
        id: responsedecode['data'][i]["id"],
        tanggalPemeriksaan: responsedecode['data'][i]["tanggal_pemeriksaan"],
        tinggiBadan: responsedecode['data'][i]["tinggi_badan"].toDouble(),
        beratBadan: responsedecode['data'][i]["berat_badan"].toDouble(),
        lingkarPerut: responsedecode['data'][i]["lingkar_perut"].toDouble(),
        denyutJantungBayi:
            responsedecode['data'][i]["denyut_jantung_bayi"].toDouble(),
        denyutNadi: responsedecode['data'][i]["denyut_nadi"].toDouble(),
        penanganan: responsedecode['data'][i]["penanganan"],
        keluhan: responsedecode['data'][i]["keluhan"],
        catatan: responsedecode['data'][i]["catatan"],
        ibuHamilId: responsedecode['data'][i]["ibu_hamil_id"],
        petugasKesehatanId: responsedecode['data'][i]["petugas_kesehatan_id"],
        // createdAt: responsedecode['data'][i]["created_at"],
        // updatedAt: responsedecode['data'][i]["updated_at"],
      );
      listTwoLastDataPemeriksaanIbuHamil
          .add(twoLastDataPemeriksaanIbuHamilModel);
    }
    listTwoLastDataPemeriksaanIbuHamil.refresh();
    // print(
    //     'from controller' + listTwoLastDataPemeriksaanBalita.length.toString());
  }
}
