import 'dart:convert';

import 'package:get/get.dart';

import '../Model/PemeriksaanIbuHamilModel.dart';
import '../Service/PemeriksaanIbuHamilService.dart';

class PemeriksaanIbuHamilController extends GetxController
    implements GetxService {
  var listPemeriksaanIbuHamil = <PemeriksaanIbuHamilModel>[].obs;
  // var storePemeriksaanIbuByPetugas =
  final service = PemeriksaanIbuHamilService();
  var isLoading = false.obs;
  RxBool isLang = false.obs;

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

  // Future<void> StorePemeriksaanIbuByPetugas() async {
  //   isLoading.value = true;

  //   detailKeluarga.value.namaLengkap = nama_lengkap.text;
  //   detailKeluarga.value.nik = det_nik.text;
  //   detailKeluarga.value.tempatLahir = tempat_lahir.text;
  //   detailKeluarga.value.tanggalLahir = tanggal_lahir.text;
  //   detailKeluarga.value.agama = agama.text;
  //   detailKeluarga.value.noTelp = no_telp.text;
  //   detailKeluarga.value.jenisPekerjaan = jenis_pekerjaan.text;
  //   detailKeluarga.value.kewarganegaraan = kewarganegaraan.text;
  //   detailKeluarga.value.jenisKelamin = jenis_kelamin;
  //   detailKeluarga.value.golonganDarah = golongan_darah;
  //   detailKeluarga.value.statusPerkawinan = status_perkawinan;
  //   detailKeluarga.value.statusDalamKeluarga = status_keluarga;
  //   detailKeluarga.value.pendidikan = pendidikan.text;

  //   var response = await service.storeMyDetailKeluarga(detailKeluarga.value);
  //   var responsedecode = jsonDecode(response.body);
  //   isLoading.value = false;

  //   Get.back();
  //   resetForm();
  // }
}
