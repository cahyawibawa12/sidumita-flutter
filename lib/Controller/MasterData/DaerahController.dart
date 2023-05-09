import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/DesaModel.dart';
import 'package:posyandu/Model/MasterData/DusunModel.dart';
import 'package:posyandu/Model/MasterData/KabupatenModel.dart';
import 'package:posyandu/Model/MasterData/KecamatanModel.dart';
import 'package:posyandu/Model/MasterData/ProvinsiModel.dart';
import 'package:posyandu/Service/MasterData/DesaService.dart';
import 'package:posyandu/Service/MasterData/DusunService.dart';
import 'package:posyandu/Service/MasterData/KabupatenService.dart';
import 'package:posyandu/Service/MasterData/KecamatanService.dart';
import 'package:posyandu/Service/MasterData/ProvinsiService.dart';

class DaerahController extends GetxController implements GetxService {
  var listProvinsi = <ProvinsiModel>[].obs;
  final serviceProvinsi = ProvinsiService();
  var listKabupaten = <KabupatenModel>[].obs;
  final serviceKabupaten = KabupatenService();
  var listKecamatan = <KecamatanModel>[].obs;
  final serviceKecamatan = KecamatanService();
  var listDesa = <DesaModel>[].obs;
  final serviceDesa = DesaService();
  var listDusun = <DusunModel>[].obs;
  final serviceDusun = DusunService();
  var isLoading = false.obs;

  //Controller Provinsi
  Future<void> getProvinsi() async {
    isLoading.value = true;
    var response = await serviceProvinsi.showProvinsi();
    var responsedecode = jsonDecode(response.body);
    listProvinsi.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      ProvinsiModel provinsiModel =
          ProvinsiModel.fromJson(responsedecode['data'][i]);
      listProvinsi.add(provinsiModel);
    }
    isLoading.value = false;
  }

  //Controller Kabupaten
  Future<void> getKabupaten() async {
    isLoading.value = true;
    var response = await serviceKabupaten.showKabupaten();
    var responsedecode = jsonDecode(response.body);
    listKabupaten.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KabupatenModel kabupatenModel =
          KabupatenModel.fromJson(responsedecode['data'][i]);
      listKabupaten.add(kabupatenModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchProvinsi({required int? provinsi_id}) async {
    isLoading.value = true;

    var provinsi = KabupatenModel(provinsiId: provinsi_id);

    var response = await serviceKabupaten.fecthProvinsi(provinsi);
    var responsedecode = jsonDecode(response.body);
    listKabupaten.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KabupatenModel kabupatenModel =
          KabupatenModel.fromJson(responsedecode['data'][i]);
      listKabupaten.add(kabupatenModel);
    }
    isLoading.value = false;
  }

  //Controller Kecamatan
  Future<void> getKecamatan() async {
    isLoading.value = true;
    var response = await serviceKecamatan.showKecamatan();
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

    var response = await serviceKecamatan.fecthKabupaten(kabupaten);
    var responsedecode = jsonDecode(response.body);
    listKecamatan.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      KecamatanModel kecamatanModel =
          KecamatanModel.fromJson(responsedecode['data'][i]);
      listKecamatan.add(kecamatanModel);
    }
    isLoading.value = false;
  }

  //Controller Desa
  Future<void> getDesa() async {
    isLoading.value = true;
    var response = await serviceDesa.showDesa();
    var responsedecode = jsonDecode(response.body);
    listDesa.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DesaModel desaModel = DesaModel.fromJson(responsedecode['data'][i]);
      listDesa.add(desaModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchKecamatan({required int? kecamatan_id}) async {
    isLoading.value = true;

    var kecamatan = DesaModel(kecamatanId: kecamatan_id);

    var response = await serviceDesa.fecthKecamatan(kecamatan);
    var responsedecode = jsonDecode(response.body);
    listDesa.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DesaModel desaModel = DesaModel.fromJson(responsedecode['data'][i]);
      listDesa.add(desaModel);
    }
    isLoading.value = false;
  }

  Future<void> getDusun() async {
    isLoading.value = true;
    var response = await serviceDusun.showDusun();
    var responsedecode = jsonDecode(response.body);
    listDusun.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DusunModel dusunModel = DusunModel.fromJson(responsedecode['data'][i]);
      listDusun.add(dusunModel);
    }
    isLoading.value = false;
  }

  Future<void> fetchDesa({required int? desa_id}) async {
    isLoading.value = true;

    var desa = DusunModel(desaId: desa_id);

    var response = await serviceDusun.fecthDesa(desa);
    var responsedecode = jsonDecode(response.body);
    listDusun.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DusunModel dusunModel = DusunModel.fromJson(responsedecode['data'][i]);
      listDusun.add(dusunModel);
    }
    isLoading.value = false;
  }
}
