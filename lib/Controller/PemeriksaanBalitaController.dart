import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/PemeriksaanBalitaModel.dart';
import 'package:posyandu/Service/PemeriksaanBalitaService.dart';

class PemeriksaanBalitaController extends GetxController
    implements GetxService {
  var listPemeriksaanBalita = <PemeriksaanBalitaModel>[].obs;
  final service = PemeriksaanBalitaService();
  RxBool isLang = false.obs;

  Future<void> getPemeriksaanBalita(int balita_id) async {
    var response = await service.pemeriksaanbalita(balita_id);
    var responsedecode = jsonDecode(response.body);
    listPemeriksaanBalita.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanBalitaModel pemeriksaanBalitaModel = PemeriksaanBalitaModel(
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
        dokterId: responsedecode['data'][i]["dokter_id"],
        createdAt: responsedecode['data'][i]["created_at"],
        updatedAt: responsedecode['data'][i]["updated_at"],
      );
      listPemeriksaanBalita.add(pemeriksaanBalitaModel);
    }
    listPemeriksaanBalita.refresh();
    print('from pemeriksaan controller' +
        listPemeriksaanBalita.length.toString());
  }
}