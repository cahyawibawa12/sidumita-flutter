import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/DetailKeluargaModel.dart';
import 'package:posyandu/Model/PetugasWithDetailKeluargaModel.dart';
import 'package:posyandu/Model/UmurModel.dart';
import 'package:posyandu/Service/DetailKeluargaService.dart';
import 'package:posyandu/Service/PetugasService.dart';

class DetailKeluargaController extends GetxController implements GetxService {
  var listDetailKeluarga = <DetailKeluargaModel>[].obs;
  var detailKeluarga = DetailKeluargaModel().obs;
  var umurPeserta = UmurModel().obs;
  var listPetugasWithDetailKeluarga = <PetugasWithDetailKeluargaModel>[].obs;
  final servicePetugas = PetugasService();
  final service = DetailKeluargaService();

  var isLoading = false.obs;

  @override
  void resetForm() {
    nama_lengkap.clear();
    det_nik.clear();
    tempat_lahir.clear();
    tanggal_lahir.clear();
    agama = null;
    no_telp.clear();
    kewarganegaraan.clear();
    jenis_pekerjaan.clear();
    pendidikan_terakhir = null;
    golongan_darah = null;
    status_keluarga = null;
    status_perkawinan = null;
    jenis_kelamin = null;
  }

  String? jenis_kelamin,
      golongan_darah,
      status_perkawinan,
      status_keluarga,
      pendidikan_terakhir,
      agama;
  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController det_nik = TextEditingController();
  TextEditingController tempat_lahir = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController agama_controller = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController jenis_pekerjaan = TextEditingController();
  TextEditingController status_dalam_keluarga = TextEditingController();
  TextEditingController kewarganegaraan = TextEditingController();
  TextEditingController pendidikan_controller = TextEditingController();
  TextEditingController jenis_kelamins = TextEditingController();
  TextEditingController golongan_darahs = TextEditingController();

  Future<void> showDetailKeluarga() async {
    isLoading.value = true;
    var response = await service.showDetailKeluarga();
    var responsedecode = jsonDecode(response.body);
    listDetailKeluarga.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DetailKeluargaModel detailKeluargaModel =
          DetailKeluargaModel.fromJson(responsedecode['data'][i]);
      listDetailKeluarga.add(detailKeluargaModel);
    }
    isLoading.value = false;
  }

  Future<void> StoreDetailKeluarga() async {
    isLoading.value = true;

    detailKeluarga.value.namaLengkap = nama_lengkap.text;
    detailKeluarga.value.nik = det_nik.text;
    detailKeluarga.value.tempatLahir = tempat_lahir.text;
    detailKeluarga.value.tanggalLahir = tanggal_lahir.text;
    detailKeluarga.value.agama = agama;
    detailKeluarga.value.noTelp = no_telp.text;
    detailKeluarga.value.jenisPekerjaan = jenis_pekerjaan.text;
    detailKeluarga.value.kewarganegaraan = kewarganegaraan.text;
    detailKeluarga.value.jenisKelamin = jenis_kelamin;
    detailKeluarga.value.golonganDarah = golongan_darah;
    detailKeluarga.value.statusPerkawinan = status_perkawinan;
    detailKeluarga.value.statusDalamKeluarga = status_keluarga;
    detailKeluarga.value.pendidikan = pendidikan_terakhir;

    var response = await service.storeMyDetailKeluarga(detailKeluarga.value);
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

  Future<void> StoreDetailKeluargaByPetugas(int keluarga_id) async {
    isLoading.value = true;

    detailKeluarga.value.namaLengkap = nama_lengkap.text;
    detailKeluarga.value.nik = det_nik.text;
    detailKeluarga.value.tempatLahir = tempat_lahir.text;
    detailKeluarga.value.tanggalLahir = tanggal_lahir.text;
    detailKeluarga.value.agama = agama;
    detailKeluarga.value.noTelp = no_telp.text;
    detailKeluarga.value.jenisPekerjaan = jenis_pekerjaan.text;
    detailKeluarga.value.kewarganegaraan = kewarganegaraan.text;
    detailKeluarga.value.jenisKelamin = jenis_kelamin;
    detailKeluarga.value.golonganDarah = golongan_darah;
    detailKeluarga.value.statusPerkawinan = status_perkawinan;
    detailKeluarga.value.statusDalamKeluarga = status_keluarga;
    detailKeluarga.value.pendidikan = pendidikan_terakhir;
    detailKeluarga.value.keluargaId = keluarga_id;

    var response =
        await service.storeDetailKeluargaByPetugas(detailKeluarga.value);
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

  Future<void> UpdateDetailKeluarga(int id) async {
    isLoading.value = true;

    detailKeluarga.value.id = id;
    detailKeluarga.value.namaLengkap = nama_lengkap.text;
    detailKeluarga.value.nik = det_nik.text;
    detailKeluarga.value.tempatLahir = tempat_lahir.text;
    detailKeluarga.value.tanggalLahir = tanggal_lahir.text;
    detailKeluarga.value.agama = agama;
    detailKeluarga.value.noTelp = no_telp.text;
    detailKeluarga.value.jenisPekerjaan = jenis_pekerjaan.text;
    detailKeluarga.value.kewarganegaraan = kewarganegaraan.text;
    detailKeluarga.value.jenisKelamin = jenis_kelamin;
    detailKeluarga.value.golonganDarah = golongan_darah;
    detailKeluarga.value.statusPerkawinan = status_perkawinan;
    detailKeluarga.value.statusDalamKeluarga = status_keluarga;
    detailKeluarga.value.pendidikan = pendidikan_terakhir;

    var response = await service.updateMyDetailKeluarga(detailKeluarga.value);
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
    }
    isLoading.value = false;
  }

  Future<void> deleteDetailKeluarga(int id) async {
    isLoading.value = true;

    var response = await service.deleteMyDetailKeluarga(id);
    var responsedecode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // Get.back();
      Get.snackbar(
        'Delete Berhasil',
        "Data berhasil di hapus",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    } else {
      Get.snackbar(
        'Delete Gagal',
        "Data gagal dihapus, mohon periksa kembali",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    isLoading.value = false;
  }

  Future<void> GetUmur(int id) async {
    isLoading.value = true;
    var response = await service.GetUmur(id);
    var responsedecode = jsonDecode(response.body);

    umurPeserta.value = UmurModel.fromJson(responsedecode['data']);

    isLoading.value = false;
  }

  Future<void> showDetailKeluargaForPetugas(int keluarga_id) async {
    isLoading.value = true;
    var response =
        await servicePetugas.showDetailKeluargaForPetugas(keluarga_id);
    var responsedecode = jsonDecode(response.body);

    listPetugasWithDetailKeluarga.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      PetugasWithDetailKeluargaModel petugasWithDetailKeluargaModel =
          PetugasWithDetailKeluargaModel.fromJson(responsedecode['data'][i]);
      listPetugasWithDetailKeluarga.add(petugasWithDetailKeluargaModel);
    }
    // Map obj = responsedecode;
    // data = List<Map<String, dynamic>>.from(obj["data"]);
    isLoading.value = false;
  }
}
