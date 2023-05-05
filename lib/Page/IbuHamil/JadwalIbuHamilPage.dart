import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/JadwalContoller.dart';
import 'package:posyandu/widget/table_calendar/table_calendar.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class JadwalIbuHamilPage extends StatefulWidget {
  const JadwalIbuHamilPage({super.key});

  @override
  State<JadwalIbuHamilPage> createState() => _JadwalIbuHamilPageState();
}

class _JadwalIbuHamilPageState extends State<JadwalIbuHamilPage> {
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
