import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/PemeriksaanIbuHamilByPetugasModel.dart';

import '../Model/PemeriksaanIbuHamilModel.dart';
import '../Service/PemeriksaanIbuHamilService.dart';

class PemeriksaanIbuHamilController extends GetxController
    implements GetxService {
  var listPemeriksaanIbuHamil = <PemeriksaanIbuHamilModel>[].obs;
  var storePemeriksaanIbuByPetugas = PemeriksaanIbuHamilByPetugasModel().obs;
  final service = PemeriksaanIbuHamilService();
  var isLoading = false.obs;
  RxBool isLang = false.obs;

  @override
  void resetForm() {
    umur_kandunganCtrl.clear();
    berat_badanCtrl.clear();
    tinggi_badanCtrl.clear();
    lingkar_perutCtrl.clear();
    denyut_jantung_bayiCtrl.clear();
    denyut_nadiCtrl.clear();
    keluhanCtrl.clear();
    penangananCtrl.clear();
    catatanCtrl.clear();
    // golongan_darah = null;
    // status_keluarga = null;
    // status_perkawinan = null;
    // jenis_kelamin = null;
  }

  TextEditingController umur_kandunganCtrl = TextEditingController();
  TextEditingController berat_badanCtrl = TextEditingController();
  TextEditingController tinggi_badanCtrl = TextEditingController();
  TextEditingController lingkar_perutCtrl = TextEditingController();
  TextEditingController denyut_nadiCtrl = TextEditingController();
  TextEditingController denyut_jantung_bayiCtrl = TextEditingController();
  TextEditingController keluhanCtrl = TextEditingController();
  TextEditingController penangananCtrl = TextEditingController();
  TextEditingController catatanCtrl = TextEditingController();
  TextEditingController tanggal_pemeriksaanCtrl = TextEditingController();

  Future<void> getPemeriksaanIbuHamil(int ibu_hamil_id) async {
    isLoading.value = true;
    var response = await service.pemeriksaanibuhamil(ibu_hamil_id);
    var responsedecode = jsonDecode(response.body);
    listPemeriksaanIbuHamil.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanIbuHamilModel pemeriksaanIbuHamilModel =
          PemeriksaanIbuHamilModel(
        id: responsedecode['data'][i]["id"],
        tanggalPemeriksaan: responsedecode['data'][i]["tanggal_pemeriksaan"],
        umurKandungan: responsedecode['data'][i]["umur_kandungan"],
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
      listPemeriksaanIbuHamil.add(pemeriksaanIbuHamilModel);
    }
    listPemeriksaanIbuHamil.refresh();
    print('from pemeriksaan controller' +
        listPemeriksaanIbuHamil.length.toString());

    isLoading.value = false;
  }

  Future<void> StorePemeriksaanIbuByPetugas({required int ibu_hamil_id}) async {
    isLoading.value = true;

    // detailKeluarga.value.namaLengkap = nama_lengkap.text;
    storePemeriksaanIbuByPetugas.value.tanggalPemeriksaan =
        tanggal_pemeriksaanCtrl.text;
    storePemeriksaanIbuByPetugas.value.umurKandungan = umur_kandunganCtrl.text;
    storePemeriksaanIbuByPetugas.value.beratBadan = berat_badanCtrl.text;
    storePemeriksaanIbuByPetugas.value.tinggiBadan = tinggi_badanCtrl.text;
    storePemeriksaanIbuByPetugas.value.lingkarPerut = lingkar_perutCtrl.text;
    storePemeriksaanIbuByPetugas.value.denyutJantungBayi =
        denyut_jantung_bayiCtrl.text;
    storePemeriksaanIbuByPetugas.value.denyutNadi = denyut_nadiCtrl.text;
    storePemeriksaanIbuByPetugas.value.keluhan = keluhanCtrl.text;
    storePemeriksaanIbuByPetugas.value.penanganan = penangananCtrl.text;
    storePemeriksaanIbuByPetugas.value.catatan = catatanCtrl.text;
    storePemeriksaanIbuByPetugas.value.ibuHamilId = ibu_hamil_id;

    var response = await service.StorePemeriksaanIbuByPetugas(
        storePemeriksaanIbuByPetugas.value);
    var responsedecode = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar(
        'Create Berhasil',
        "Data berhasil ditambah",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
      resetForm();
    } else {
      Get.snackbar(
        'Create Gagal',
        "Data gagal ditambah, mohon periksa kembali",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    isLoading.value = false;

    // Get.back();
  }
}
