import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/PemeriksaanBalitaByPetugasModel.dart';
import 'package:posyandu/Model/PemeriksaanBalitaModel.dart';
import 'package:posyandu/Service/PemeriksaanBalitaService.dart';

class PemeriksaanBalitaController extends GetxController
    implements GetxService {
  var listPemeriksaanBalita = <PemeriksaanBalitaModel>[].obs;
  var pemeriksaanBalitaByPetugas = PemeriksaanBalitaByPetugas().obs;
  final service = PemeriksaanBalitaService();
  var isLoading = false.obs;
  RxBool isLang = false.obs;
  List<Map<dynamic, dynamic>> data = [];

  TextEditingController tanggal_pemeriksaan = TextEditingController();
  TextEditingController umur_balita = TextEditingController();
  TextEditingController berat = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  TextEditingController lingkar_kepala = TextEditingController();
  TextEditingController lingkar_lengan = TextEditingController();
  TextEditingController keluhan = TextEditingController();
  TextEditingController penanganan = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController dokter_id = TextEditingController();
  TextEditingController vitamin_id = TextEditingController();
  int? vaksin_id;

  var vaksinChecked = <Map<String, dynamic>>[];

  Future<void> getPemeriksaanBalita(int balita_id) async {
    isLoading.value = true;
    var response = await service.pemeriksaanbalita(balita_id);
    var responsedecode = jsonDecode(response.body);
    listPemeriksaanBalita.clear();
    data.clear();

    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanBalitaModel pemeriksaanBalitaModel = PemeriksaanBalitaModel(
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
        dokterId: responsedecode['data'][i]["dokter_id"],
        createdAt: responsedecode['data'][i]["created_at"],
        updatedAt: responsedecode['data'][i]["updated_at"],
      );
      listPemeriksaanBalita.add(pemeriksaanBalitaModel);
      // Map obj = responsedecode['data'];
      // tinggi.add(obj);
      // tinggi = List<Map<dynamic, dynamic>>.from(obj["data"]);
    }
    Map obj = responsedecode;
    data = List<Map<dynamic, dynamic>>.from(obj["data"]);

    listPemeriksaanBalita.refresh();
    print('from pemeriksaan controller' +
        listPemeriksaanBalita.length.toString());
    isLoading.value = false;
  }

  Future<void> StorePemeriksaanBalitaByPetugas(
      {required List<Map<String, dynamic>> vaksins,
      required int balita_id}) async {
    isLoading.value = true;

    pemeriksaanBalitaByPetugas.value.tanggalPemeriksaan =
        tanggal_pemeriksaan.text;
    pemeriksaanBalitaByPetugas.value.umurBalita = umur_balita.text;
    pemeriksaanBalitaByPetugas.value.beratBadan = double.parse(berat.text);
    pemeriksaanBalitaByPetugas.value.tinggiBadan = double.parse(tinggi.text);
    pemeriksaanBalitaByPetugas.value.lingkarKepala =
        double.parse(lingkar_kepala.text);
    pemeriksaanBalitaByPetugas.value.lingkarLengan =
        double.parse(lingkar_lengan.text);
    pemeriksaanBalitaByPetugas.value.catatan = catatan.text;
    pemeriksaanBalitaByPetugas.value.keluhan = keluhan.text;
    pemeriksaanBalitaByPetugas.value.penanganan = penanganan.text;
    pemeriksaanBalitaByPetugas.value.vitaminId = int.parse(vitamin_id.text);
    pemeriksaanBalitaByPetugas.value.dokterId = int.parse(dokter_id.text);
    pemeriksaanBalitaByPetugas.value.balitaId = balita_id;

    vaksins.forEach((element) {
      if (element['checked']) {
        // vaksinChecked.add(element);
        pemeriksaanBalitaByPetugas.value.vaksinId!.add(element['id']);
      }
    });
    var response = await service.StorePemeriksaanBalitaByPetugas(
        pemeriksaanBalitaByPetugas.value);
    var responsedecode = jsonDecode(response.body);
    isLoading.value = false;

    Get.back();
    // resetForm();
  }
}
