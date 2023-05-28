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

  Future<void> _refresh(bool reload) async {
    await Get.find<JadwalController>().getEvents();
  }

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
          body: RefreshIndicator(
            onRefresh: () async {
              await _refresh(true);
            },
            child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("Jadwal Posyandu",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () {
                          if (controller.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return SizedBox(
                              height: 700.0,
                              child: QTableCalendar(
                                events: controller.events.value,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
