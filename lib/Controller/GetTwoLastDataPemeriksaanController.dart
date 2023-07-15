import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/GetTwoLastDataPemeriksaanModel.dart';
import 'package:posyandu/Service/GetTwoLastDataPemeriksaanBalitaService.dart';
import 'package:posyandu/Service/PemeriksaanBalitaService.dart';

class GetTwoLastDataPemeriksaanBalitaController extends GetxController
    implements GetxService {
  var listTwoLastDataPemeriksaanBalita = <GetTwoLastDataPemeriksaanModel>[].obs;
  final service = GetTwoLastDataPemeriksaanBalitaService();

  Future<void> getTwoLastDataPemeriksaanBalita(int balita_id) async {
    var response = await service.twolastdatapemeriksaanbalita(balita_id);
    var responsedecode = jsonDecode(response.body);
    listTwoLastDataPemeriksaanBalita.clear();

    for (var i = 0; i < responsedecode['data'].length; i++) {
      GetTwoLastDataPemeriksaanModel twoLastDataPemeriksaanBalitaModel =
          GetTwoLastDataPemeriksaanModel(
        id: responsedecode['data'][i]["id"],
        tanggalPemeriksaan: responsedecode['data'][i]["tanggal_pemeriksaan"],
        lingkarKepala: responsedecode['data'][i]["lingkar_kepala"].toDouble(),
        lingkarLengan: responsedecode['data'][i]["lingkar_lengan"].toDouble(),
        tinggiBadan: responsedecode['data'][i]["tinggi_badan"].toDouble(),
        beratBadan: responsedecode['data'][i]["berat_badan"].toDouble(),
        penanganan: responsedecode['data'][i]["penanganan"],
        keluhan: responsedecode['data'][i]["keluhan"],
        catatan: responsedecode['data'][i]["catatan"],
        vitaminId: responsedecode['data'][i]["vitamin_id"],
        balitaId: responsedecode['data'][i]["balita_id"],
        petugasKesehatanId: responsedecode['data'][i]["petugas_kesehatan_id"],
        dokterId: responsedecode['data'][i]["dokter_id"] ?? 0,
        createdAt: responsedecode['data'][i]["created_at"],
        updatedAt: responsedecode['data'][i]["updated_at"],
      );
      listTwoLastDataPemeriksaanBalita.add(twoLastDataPemeriksaanBalitaModel);
    }
    listTwoLastDataPemeriksaanBalita.refresh();
    // print(
    //     'from controller' + listTwoLastDataPemeriksaanBalita.length.toString());
  }

  // @override
  // void onInit() {
  //   getTwoLastDataPemeriksaanBalita(2);
  // }
}
