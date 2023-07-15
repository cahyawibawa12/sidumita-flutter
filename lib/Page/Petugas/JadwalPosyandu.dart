import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/JadwalContoller.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:posyandu/widget/table_calendar/table_calendar.dart';

class JadwalPosyandu extends StatefulWidget {
  const JadwalPosyandu({super.key});

  @override
  State<JadwalPosyandu> createState() => _JadwalPosyanduState();
}

class _JadwalPosyanduState extends State<JadwalPosyandu> {
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
          appBar: AppBar(
            title: Text("Jadwal Posyandu"),
            backgroundColor: Color(0xff34BE82),
          ),
          body: SafeArea(
              child: RefreshIndicator(
            onRefresh: () async {
              await _refresh(true);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.15,
                          child: QTableCalendar(
                            events: controller.events.value,
                          ),
                        );
                      }
                    },
                  )
                ]),
              ),
            ),
          )),
        )
      ],
    );
  }
}
