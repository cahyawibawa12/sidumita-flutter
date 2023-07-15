import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/PemeriksaanBalitaByPetugasModel.dart';
import 'package:posyandu/Model/PemeriksaanBalitaModel.dart';
import 'package:posyandu/Service/DetailPemeriksaanBalitaService.dart';

class DetailPemeriksaanBalitaController extends GetxController
    implements GetxService {
  var listDetailPemeriksaanBalita = <PemeriksaanBalitaModel>[].obs;
  var showDetailPemeriksaanBalita = <PemeriksaanBalitaByPetugas>[].obs;
  final service = DetailPemeriksaanBalitaService();
  var isLoading = false.obs;

  Future<void> getDetailPemeriksaanBalita(int balita_id) async {
    var response = await service.detailpemeriksaanbalita(balita_id);
    var responsedecode = jsonDecode(response.body);
    // List<Map<dynamic, dynamic>> tinggi = [];

    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanBalitaModel detailPemeriksaanBalitaModel =
          PemeriksaanBalitaModel(
        id: responsedecode['data'][i]["id"],
        tanggalPemeriksaan: responsedecode['data'][i]["tanggal_pemeriksaan"],
        umurBalita: responsedecode['data'][i]["umur_balita"],
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
      listDetailPemeriksaanBalita.add(detailPemeriksaanBalitaModel);
      // Map obj = responsedecode['data'];
      // tinggi = List<Map<dynamic, dynamic>>.from(obj["data"]);
    }
    listDetailPemeriksaanBalita.refresh();
    // print('from pemeriksaan controller' +
    //     listPemeriksaanBalita.length.toString());
  }

  Future<void> showDetailPemeriksaanBaby(int balita_id) async {
    isLoading.value = true;
    var response = await service.showDetailPemeriksaanBalita(balita_id);
    var responsedecode = jsonDecode(response.body);
    showDetailPemeriksaanBalita.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanBalitaByPetugas pemeriksaanBalitaByPetugas =
          PemeriksaanBalitaByPetugas.fromJson(responsedecode['data'][i]);
      showDetailPemeriksaanBalita.add(pemeriksaanBalitaByPetugas);
    }
    isLoading.value = false;
  }
}
