import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Service/KeluargaService.dart';

class KeluargaController extends GetxController implements GetxService {
  var keluarga = KeluargaModel().obs;
  final service = KeluargaService();
  var isLoading = false.obs;
  TextEditingController nikKeluarga = TextEditingController();
  TextEditingController kepalaKeluarga = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  TextEditingController alamat = TextEditingController();
  int? dusun_id;

  Future<void> ShowKeluarga() async {
    isLoading.value = true;
    var response = await service.showMyKeluarga();
    var responsedecode = jsonDecode(response.body);

    keluarga.value = KeluargaModel.fromJson(responsedecode['data']);

    nikKeluarga.text = keluarga.value.noKartuKeluarga!;
    kepalaKeluarga.text = keluarga.value.kepalaKeluarga!;
    jumlah.text = keluarga.value.jumlah!.toString();
    alamat.text = keluarga.value.alamat!;

    isLoading.value = false;
  }

  // Future<void> StoreKeluarga() async {
  //   isLoading.value = true;
  //   var response = await service.storeMyKeluarga();
  //   var responsedecode = jsonDecode(response.body);

  //   keluarga.value = KeluargaModel.fromJson(responsedecode['data']);

  //   nikKeluarga.text = keluarga.value.noKartuKeluarga!;
  //   kepalaKeluarga.text = keluarga.value.kepalaKeluarga!;
  //   jumlah.text = keluarga.value.jumlah!.toString();
  //   alamat.text = keluarga.value.alamat!;
  //   dusun.text = keluarga.value.dusun!.namaDusun.toString();

  //   isLoading.value = false;
  // }

  Future<void> UpdateKeluarga() async {
    isLoading.value = true;

    keluarga.value.noKartuKeluarga = nikKeluarga.text;
    keluarga.value.kepalaKeluarga = kepalaKeluarga.text;
    keluarga.value.alamat = alamat.text;
    // keluarga.value.dusunId = dusun_id;

    var response = await service.updateMyKeluarga(keluarga.value);
    var responsedecode = jsonDecode(response.body);
    if (response.statusCode == 200) {
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
}
