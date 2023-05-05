import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/IbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/widget/widgets.dart';

class LandingIbuHamil extends StatefulWidget {
  const LandingIbuHamil({super.key});

  @override
  State<LandingIbuHamil> createState() => _LandingIbuHamilState();
}

class _LandingIbuHamilState extends State<LandingIbuHamil> {
  var ibuHamil = Get.put(IbuHamilController());

  @override
  void initState() {
    super.initState();
    ibuHamil.ShowIbuHamil();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    AssetImage('assets/images/bg.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Sistem Informasi Ibu Hamil dan Balita"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(162, 255, 255, 255)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "List Ibu Hamil :",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Obx(() => ibuHamil.isLoading.value
                                    ? CircularProgressIndicator()
                                    : SingleChildScrollView(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              ibuHamil.listIbuHamil.length,
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              child: ListTile(
                                                title: Text(ibuHamil
                                                    .listIbuHamil[index]
                                                    .detailKeluarga!
                                                    .namaLengkap
                                                    .toString()),
                                                // subtitle: Text(detailKeluarga
                                                //     .listDetailKeluarga[index].nik!),
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ButtonNavBarIbuHamil(
                                                                ibuHamilModel:
                                                                    ibuHamil.listIbuHamil[
                                                                        index],
                                                              )));
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        )
      ],
    );
  }
}
