import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/PemeriksaanBalitaModel.dart';
import 'package:posyandu/Service/DetailPemeriksaanBalitaService.dart';

class DetailPemeriksaanBalitaController extends GetxController
    implements GetxService {
  var listDetailPemeriksaanBalita = <PemeriksaanBalitaModel>[].obs;
  final service = DetailPemeriksaanBalitaService();

  Future<void> getDetailPemeriksaanBalita(int balita_id) async {
    var response = await service.detailpemeriksaanbalita(balita_id);
    var responsedecode = jsonDecode(response.body);

    for (var i = 0; i < responsedecode['data'].length; i++) {
      PemeriksaanBalitaModel detailPemeriksaanBalitaModel =
          PemeriksaanBalitaModel(
        id: responsedecode['data'][i]["id"],
        tanggal_pemeriksaan: responsedecode['data'][i]["tanggal_pemeriksaan"],
        lingkar_kepala: responsedecode['data'][i]["lingkar_kepala"].toDouble(),
        lingkar_lengan: responsedecode['data'][i]["lingkar_lengan"].toDouble(),
        tinggi_badan: responsedecode['data'][i]["tinggi_badan"].toDouble(),
        berat_badan: responsedecode['data'][i]["berat_badan"].toDouble(),
        penanganan: responsedecode['data'][i]["penanganan"],
        keluhan: responsedecode['data'][i]["keluhan"],
        bulan_imunisasi_id: responsedecode['data'][i]["bulan_imunisasi_id"],
        balita_id: responsedecode['data'][i]["balita_id"],
        petugas_kesehatan_id: responsedecode['data'][i]["petugas_kesehatan_id"],
        created_at: responsedecode['data'][i]["created_at"],
        updated_at: responsedecode['data'][i]["updated_at"],
      );
      listDetailPemeriksaanBalita.add(detailPemeriksaanBalitaModel);
    }
    listDetailPemeriksaanBalita.refresh();
    // print('from pemeriksaan controller' +
    //     listPemeriksaanBalita.length.toString());
  }
}
