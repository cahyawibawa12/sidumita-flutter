import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/EditPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/FormAnggotaPeserta.dart';

import 'package:posyandu/widget/widgets.dart';

class Peserta extends StatefulWidget {
  const Peserta({super.key});

  @override
  State<Peserta> createState() => _PesertaState();
}

class _PesertaState extends State<Peserta> {
  var detailKeluarga = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    detailKeluarga.showDetailKeluarga();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        detailKeluarga.showDetailKeluarga();
      },
      child: Stack(children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(children: <Widget>[
                Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      child: Column(children: [
                        Text(
                          "SIDUMITA",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("Sistem Informasi Ibu Hamil dan Balita"),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/bg.png'),
                      ),
                    ),
                  ]),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormAnggotaKeluarga()));
                    },
                    child: const Text("Tambah Data"),
                  ),
                ),
                Expanded(
                  child: Obx(() => detailKeluarga.isLoading.value
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: detailKeluarga.listDetailKeluarga.length,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (detail) {},
                              confirmDismiss: (direction) async {
                                bool confirm = false;
                                await showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Are you sure you want to delete this item?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[600],
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No"),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey,
                                          ),
                                          onPressed: () {
                                            confirm = true;
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (confirm) {
                                  detailKeluarga.deleteDetailKeluarga(
                                      detailKeluarga
                                          .listDetailKeluarga[index].id!);
                                  return Future.value(true);
                                }
                                return Future.value(false);
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(detailKeluarga
                                      .listDetailKeluarga[index].namaLengkap!),
                                  subtitle: Text(detailKeluarga
                                      .listDetailKeluarga[index].nik!),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => EditPeserta(
                                                  detailKeluargaModel:
                                                      detailKeluarga
                                                              .listDetailKeluarga[
                                                          index],
                                                )));
                                  },
                                ),
                              ),
                            );
                          },
                        )),
                ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   height: context.height,
                //   width: context.width,
                //   child: ListView.builder(
                //     itemCount: 10,
                //     physics: const ScrollPhysics(),
                //     itemBuilder: (BuildContext context, int index) {
                //       return Card(
                //         color: Color.fromARGB(255, 255, 255, 255),
                //         elevation: 2,
                //         child: ListTile(
                //           leading: CircleAvatar(
                //             backgroundColor: Colors.grey[200],
                //             backgroundImage: const NetworkImage(
                //               "https://i.ibb.co/QrTHd59/woman.jpg",
                //             ),
                //           ),
                //           title: const Text("Jessica Doe"),
                //           subtitle: const Text("Programmer"),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ]),
            ))
      ]),
    );
  }
}
