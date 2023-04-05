import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/FormAnggotaPeserta.dart';

import 'package:posyandu/widget/widgets.dart';

class EditPeserta extends StatefulWidget {
  const EditPeserta({super.key});

  @override
  State<EditPeserta> createState() => _EditPesertaState();
}

class _EditPesertaState extends State<EditPeserta> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                child: ListView.builder(
                  itemCount: 10,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://i.ibb.co/QrTHd59/woman.jpg",
                          ),
                        ),
                        title: const Text("Jessica Doe"),
                        subtitle: const Text("Programmer"),
                      ),
                    );
                  },
                ),
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
    ]);
  }
}
