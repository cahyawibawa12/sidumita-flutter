import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/VaksinModel.dart';
import 'package:posyandu/Service/MasterData/VaksinService.dart';

class VaksinController extends GetxController implements GetxService {
  var listVaksin = <VaksinModel>[].obs;
  final service = VaksinService();
  var isLoading = false.obs;
  var data = <Map<String, dynamic>>[].obs;

  Future<void> getVaksin() async {
    isLoading.value = true;
    var response = await service.showVaksin();
    var responsedecode = jsonDecode(response.body);
    listVaksin.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      VaksinModel vaksinModel = VaksinModel.fromJson(responsedecode['data'][i]);
      listVaksin.add(vaksinModel);
    }
    Map obj = responsedecode;
    data.value = List<Map<String, dynamic>>.from(obj["data"]);
    for (var i = 0; i < data.length; i++) {
      data[i]['checked'] = false;
    }
    // data.forEach((element) {
    //   element['checked'] = false;
    // });

    isLoading.value = false;
  }
}
