import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 185, 246, 188)),
                        child: Center(
                          child: Text("Jadwal Posyandu",
                              style: GoogleFonts.gentiumBasic(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
