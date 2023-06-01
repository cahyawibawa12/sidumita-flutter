import 'dart:math';
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';

import '../Service/token.dart';
import '../widget/table_calendar/table_calendar_util.dart';

class JadwalController extends GetxController implements GetxService {
  static late JadwalController instance;
  // late JadwalBalitaPage view;

  @override
  void onInit() {
    super.onInit();
    // getEvents();
  }

  @override
  void dispose() => super.dispose();

  // @override
  // Widget build(BuildContext context) => widget.build(context);

  var isLoading = false.obs;
  var events = <DateTime, List<Event>>{}.obs;
  getEvents() async {
    isLoading.value = true;
    var token = await getToken();
    var response = await Dio().get(
      "https://sidumita.definitelynotgod.com/api/jadwal-pemeriksaan",
      options: Options(headers: setHeaders(token)),
    );
    Map obj = response.data;
    // sales = List<Map<dynamic, dynamic>>.from(obj["data"]);
    List eventList = obj["data"];
    for (var event in eventList) {
      // var date = DateTime.parse(event["date"]);
      var eventName = event["jenis_pemeriksaan"];
      var startEvent = DateTime.parse(event["waktu_mulai"]);
      var endEvent = DateTime.parse(event["waktu_berakhir"]);
      var locationName = event["nama_dusun"];
      events.value[startEvent] = [
        Event(
          title: eventName + " - " + locationName,
          start: DateFormat.jm().format(startEvent),
          end: DateFormat.jm().format(endEvent),
        ),
      ];
      // events.value[endEvent] = [
      //   Event(
      //     title: eventName + " - " + locationName,
      //     start: DateFormat.jm().format(startEvent),
      //     end: DateFormat.jm().format(endEvent),
      //   ),
      // ];
    }
    events.refresh();
    update();
    isLoading.value = false;
    // setState(() {});
  }
}
