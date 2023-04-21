import 'dart:convert';

import 'package:get/get.dart';
import 'package:posyandu/Model/DusunModel.dart';
import 'package:posyandu/Service/DusunService.dart';

class DusunController extends GetxController implements GetxService {
  var listDusun = <DusunModel>[].obs;
  final service = DusunService();
  var isLoading = false.obs;

  Future<void> getDusun() async {
    isLoading.value = true;
    var response = await service.showDusun();
    var responsedecode = jsonDecode(response.body);
    listDusun.clear();
    for (var i = 0; i < responsedecode['data'].length; i++) {
      DusunModel dusunModel = DusunModel.fromJson(responsedecode['data'][i]);
      listDusun.add(dusunModel);
    }
    isLoading.value = false;
  }
}
