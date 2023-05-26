import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/MasterData/VitaminModel.dart';
import 'package:posyandu/Service/MasterData/VitaminService.dart';

class VitaminController extends GetxController implements GetxService {
  var listVitamin = <VitaminModel>[].obs;
  final service = VitaminService();
  var isLoading = false.obs;

  Future<void> getVitamin() async {
    isLoading.value = true;
    var response = await service.showVitamin();
    var responsedecode = jsonDecode(response.body);
    listVitamin.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      VitaminModel vitaminModel =
          VitaminModel.fromJson(responsedecode['data'][i]);
      listVitamin.add(vitaminModel);
    }
    isLoading.value = false;
  }
}
