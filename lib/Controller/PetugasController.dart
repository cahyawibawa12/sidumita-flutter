import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:posyandu/Model/PetugasModel.dart';
import 'package:posyandu/Model/PetugasWithBalitaModel.dart';
import 'package:posyandu/Model/PetugasWithIbuHamilModel.dart';

import 'package:posyandu/Service/PetugasService.dart';

class PetugasController extends GetxController implements GetxService {
  var petugas = PetugasModel().obs;
  var listPetugasWithBalitas = <PetugasWithBalitaModel>[].obs;
  var listPetugasWithIbuHamils = <PetugasWithIbuHamilModel>[].obs;
  final service = PetugasService();
  var isLoading = false.obs;
  List<Map<String, dynamic>> data = [];

  String? jenis_kelamin;
  int? provinsi_id, kabupaten_id, kecamatan_id, desa_id, dusun_id;
  TextEditingController nama = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController tempat_lahir = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController jenis_kelamins = TextEditingController();
  TextEditingController nama_provinsi = TextEditingController();
  TextEditingController nama_kabupaten = TextEditingController();
  TextEditingController nama_kecamatan = TextEditingController();
  TextEditingController nama_desa = TextEditingController();
  TextEditingController nama_dusun = TextEditingController();
  // int? dusun_id;

  Future<void> ShowPetugas() async {
    isLoading.value = true;
    var response = await service.showMyPetugas();
    var responsedecode = jsonDecode(response.body);

    petugas.value = PetugasModel.fromJson(responsedecode['data']);

    nik.text = petugas.value.nik!;
    nama.text = petugas.value.nama!;
    alamat.text = petugas.value.alamat!;
    tempat_lahir.text = petugas.value.tempatLahir!;
    no_telp.text = petugas.value.noTelp!;
    tanggal_lahir.text = petugas.value.tanggalLahir!;
    jenis_kelamins.text = petugas.value.jenisKelamin!;
    nama_provinsi.text = petugas.value.namaProvinsi!;
    nama_kabupaten.text = petugas.value.namaKabupaten!;
    nama_kecamatan.text = petugas.value.namaKecamatan!;
    nama_desa.text = petugas.value.namaDesa!;
    nama_dusun.text = petugas.value.namaDusun!;
    jenis_kelamin = petugas.value.jenisKelamin;
    provinsi_id = petugas.value.provinsiId;
    kabupaten_id = petugas.value.kabupatenId;
    kecamatan_id = petugas.value.kecamatanId;
    desa_id = petugas.value.desaId;
    dusun_id = petugas.value.dusunId;

    isLoading.value = false;
  }

  Future<void> showBalitaForPetugas() async {
    isLoading.value = true;
    var response = await service.showBalitaForPetugas();
    var responsedecode = jsonDecode(response.body);

    listPetugasWithBalitas.clear();
    data.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PetugasWithBalitaModel petugasWithBalitaModel =
          PetugasWithBalitaModel.fromJson(responsedecode['data'][i]);
      listPetugasWithBalitas.add(petugasWithBalitaModel);
    }
    Map obj = responsedecode;
    data = List<Map<String, dynamic>>.from(obj["data"]);
    isLoading.value = false;
  }

  Future<void> showIbuHamilForPetugas() async {
    isLoading.value = true;
    var response = await service.showIbuHamilForPetugas();
    var responsedecode = jsonDecode(response.body);

    listPetugasWithIbuHamils.clear();
    data.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PetugasWithIbuHamilModel petugasWithIbuHamilModel =
          PetugasWithIbuHamilModel.fromJson(responsedecode['data'][i]);
      listPetugasWithIbuHamils.add(petugasWithIbuHamilModel);
    }
    Map obj = responsedecode;
    data = List<Map<String, dynamic>>.from(obj["data"]);
    isLoading.value = false;
  }

  Future<void> UpdatePetugas() async {
    isLoading.value = true;

    petugas.value.nik = nik.text;
    petugas.value.alamat = alamat.text;
    petugas.value.nama = nama.text;
    petugas.value.tempatLahir = tempat_lahir.text;
    petugas.value.tanggalLahir = tanggal_lahir.text;
    petugas.value.noTelp = no_telp.text;
    petugas.value.jenisKelamin = jenis_kelamin;
    // petugas.value.dusunId = dusun_id;

    var response = await service.updateMyPetugas(petugas.value);
    var responsedecode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar(
        'Update Berhasil',
        "Data berhasil diubah",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    } else {
      Get.snackbar(
        'Update Gagal',
        "Data gagal diubah, mohon periksa kembali",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );

      isLoading.value = false;
    }
  }
}
