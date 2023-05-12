import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/DusunController.dart';
import 'package:posyandu/Controller/KeluargaController.dart';
import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/Peserta.dart';
import 'package:posyandu/Page/LoginPeserta/LandingBalita.dart';
import 'package:posyandu/Page/LoginPeserta/LandingIbuHamil.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPagePeserta.dart';

class LandinLoginPeserta extends StatefulWidget {
  const LandinLoginPeserta({super.key});

  @override
  State<LandinLoginPeserta> createState() => _LandinLoginPesertaState();
}

class _LandinLoginPesertaState extends State<LandinLoginPeserta> {
  var keluarga = Get.put(KeluargaController());
  var listDusun = Get.put(DusunController());

  String _nikkaka = '';
  String _alamat = '';
  String _kepalakeluarga = '';
  String _jumlah = '';
  String? dusun_id;
  String name = '';

  @override
  void initState() {
    super.initState();
    keluarga.ShowKeluarga().whenComplete(() {
      if (keluarga.keluarga.value.dusun!.desaId != null) {
        listDusun.fetchDesa(desa_id: keluarga.keluarga.value.dusun!.desaId);
      }
    });
    // listDusun.getDusun();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if (user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang " + '${name}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Pada Sistem Informasi Posyandu Ibu Hamil dan Balita")
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (() {
                      logout();
                    }),
                    icon: const Icon(CupertinoIcons.square_arrow_left),
                    iconSize: 35,
                    color: Color.fromARGB(255, 24, 98, 26),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(162, 255, 255, 255)),
                  child: Obx(() => keluarga.isLoading.value ||
                          listDusun.isLoading.value
                      ? CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text('NIK Kartu Keluarga'),
                            TextField(
                              controller: keluarga.nikKeluarga,
                              // decoration: const InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                _nikkaka = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Alamat'),
                            TextField(
                              controller: keluarga.alamat,
                              // decoration: const InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                _alamat = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Text('Dusun'),
                            // TextField(
                            //   controller: keluarga.dusun,
                            //   // decoration: const InputDecoration(hintText: 'email'),
                            //   onChanged: (value) {
                            //     _dusun = value;
                            //   },
                            // ),
                            LayoutBuilder(builder: (context, constraint) {
                              return FormField(
                                initialValue: false,
                                enabled: true,
                                builder: (FormFieldState<bool> field) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: "Dusun",
                                      errorText: field.errorText,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: keluarga.keluarga.value
                                                        .dusunId ==
                                                    null
                                                ? null
                                                : keluarga
                                                    .keluarga.value.dusunId
                                                    .toString(),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 24.0,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .color,
                                              ),
                                            ),
                                            iconSize: 16,
                                            elevation: 16,
                                            style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontSize,
                                              fontFamily: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontFamily,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                            ),
                                            underline: Container(
                                              height: 0,
                                              color: Colors.grey[300],
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                // keluarga.keluarga.value.dusunId = newValue!;
                                                keluarga.keluarga.value
                                                        .dusunId =
                                                    int.parse(newValue!);
                                              });
                                            },
                                            items: [
                                              for (var data
                                                  in listDusun.listDusun.value)
                                                DropdownMenuItem(
                                                  child: new Text(
                                                    data.namaDusun!,
                                                  ),
                                                  value: data.id.toString(),
                                                )
                                            ]),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Kepala Keluarga'),
                            TextField(
                              controller: keluarga.kepalaKeluarga,
                              // decoration: const InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                _kepalakeluarga = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Jumlah'),
                            TextField(
                              controller: keluarga.jumlah,
                              enabled: false,
                              // decoration: const InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                _jumlah = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedButton(
                              btnText: 'Save',
                              onBtnPressed: () {
                                keluarga.UpdateKeluarga();
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedButton(
                              btnText: 'Data Keluarga',
                              onBtnPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Peserta()));
                              },
                            ),
                          ],
                        ))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(162, 255, 255, 255)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apakah Kamu?",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(340, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingBalita()),
                              );
                            }),
                            child: Text("Balita",
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(340, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingIbuHamil()),
                              );
                            }),
                            child: Text("Ibu Hamil",
                                style: TextStyle(
                                  color: Colors.black,
                                )))
                      ]))
            ],
          ))))
    ]);
  }

  void logout() async {
    // var res = await Network().getData('auth/logout');
    // var body = json.decode(res.body);
    // if (body['success'] == true) {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPagePeserta()));
    // }
  }
}
