import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/JadwalContoller.dart';
import 'package:posyandu/widget/table_calendar/table_calendar.dart';

import '../../widget/BackgroundImage.dart';

class JadwalBalitaPage extends StatefulWidget {
  const JadwalBalitaPage({super.key});

  @override
  State<JadwalBalitaPage> createState() => _JadwalBalitaPageState();
}

class _JadwalBalitaPageState extends State<JadwalBalitaPage> {
  var controller = Get.put(JadwalController());
  void initState() {
    controller.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox(
                          height: 1000.0,
                          child: QTableCalendar(
                            events: controller.events.value,
                          ),
                        );
                      }
                    },
                  )
                ],
              )),
        )
      ],
    );
  }
}
