import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PemeriksaanIbuHamilController.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';

class FormPemeriksaanIbuHamil extends StatefulWidget {
  FormPemeriksaanIbuHamil({super.key, required this.petugasWithIbuHamilModel});

  final Map petugasWithIbuHamilModel;

  @override
  State<FormPemeriksaanIbuHamil> createState() =>
      _FormPemeriksaanIbuHamilState();
}

class _FormPemeriksaanIbuHamilState extends State<FormPemeriksaanIbuHamil> {
  var pemeriksaanIbuHamilbyPetugas = Get.put(PemeriksaanIbuHamilController());
  var bioPetugas = Get.put(PetugasController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController nama_lengkap = TextEditingController();

  void initState() {
    super.initState();
    bioPetugas.ShowPetugas();
    nama_lengkap.text = widget.petugasWithIbuHamilModel['nama_lengkap'];
    pemeriksaanIbuHamilbyPetugas.tanggal_pemeriksaanCtrl.text =
        DateFormat('y-M-d').format(DateTime.now()).toString();
  }

  var tanggal = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Create Pemeriksaan Ibu Hamil"),
            backgroundColor: Color(0xff34BE82),
            leading: BackButton(
              onPressed: () {
                pemeriksaanIbuHamilbyPetugas.resetForm();
                Get.back();
              },
            ),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      readOnly: true,
                      controller: bioPetugas.nama,
                      decoration: const InputDecoration(
                        labelText: 'Nama Petugas',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        // helperText: "What's your name?",
                      ),
                      // onChanged: (value) {},
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: nama_lengkap,
                      decoration: const InputDecoration(
                        labelText: 'Nama Ibu',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        // helperText: "What's your name?",
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        setState(() {
                          tanggal = pemeriksaanIbuHamilbyPetugas
                              .tanggal_pemeriksaanCtrl.text;
                          pemeriksaanIbuHamilbyPetugas.tanggal_pemeriksaanCtrl
                              .text = DateFormat('y-M-d').format(pickedDate!);
                        });
                        tanggal = DateFormat('y-M-d').format(pickedDate!);
                        print("pickedDate: $pickedDate");
                      },
                      child: TextFormField(
                        controller: pemeriksaanIbuHamilbyPetugas
                            .tanggal_pemeriksaanCtrl,
                        maxLength: 20,
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal Pemeriksaan',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          suffixIcon: Icon(Icons.date_range),
                          // helperText: "What's your name?",
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: pemeriksaanIbuHamilbyPetugas
                                  .umur_kandunganCtrl,
                              keyboardType: TextInputType.number,
                              validator: (nameValue) {
                                if (nameValue!.isEmpty) {
                                  return 'Mohon masukan data';
                                }
                                pemeriksaanIbuHamilbyPetugas
                                    .umur_kandunganCtrl.text = nameValue;
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Umur Kandungan',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text("Minggu")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: pemeriksaanIbuHamilbyPetugas
                                      .berat_badanCtrl,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanIbuHamilbyPetugas
                                        .berat_badanCtrl.text = nameValue;
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Berat',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text("Kg"),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: pemeriksaanIbuHamilbyPetugas
                                      .tinggi_badanCtrl,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanIbuHamilbyPetugas
                                        .tinggi_badanCtrl.text = nameValue;
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Tinggi',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text("Cm"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: pemeriksaanIbuHamilbyPetugas
                                      .lingkar_perutCtrl,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanIbuHamilbyPetugas
                                        .lingkar_perutCtrl.text = nameValue;
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Lingkar Perut',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text("Cm"),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: pemeriksaanIbuHamilbyPetugas
                                      .denyut_nadiCtrl,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanIbuHamilbyPetugas
                                        .denyut_nadiCtrl.text = nameValue;
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Denyut Nadi',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    // helperText: 'Enter your email address',
                                  ),
                                ),
                              ),
                              Text("Bpm"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: pemeriksaanIbuHamilbyPetugas
                                .denyut_jantung_bayiCtrl,
                            keyboardType: TextInputType.number,
                            validator: (nameValue) {
                              if (nameValue!.isEmpty) {
                                return 'Mohon masukan data';
                              }
                              pemeriksaanIbuHamilbyPetugas
                                  .denyut_jantung_bayiCtrl.text = nameValue;
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Denyut Jantung Bayi',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Bpm"),
                      ],
                    ),
                    TextFormField(
                      controller: pemeriksaanIbuHamilbyPetugas.keluhanCtrl,
                      maxLength: 200,
                      maxLines: 4,
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanIbuHamilbyPetugas.keluhanCtrl.text =
                            nameValue;
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Keluhan',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: pemeriksaanIbuHamilbyPetugas.penangananCtrl,
                      maxLength: 200,
                      maxLines: 4,
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanIbuHamilbyPetugas.penangananCtrl.text =
                            nameValue;
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Penanganan',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: pemeriksaanIbuHamilbyPetugas.catatanCtrl,
                      maxLength: 200,
                      maxLines: 4,
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanIbuHamilbyPetugas.catatanCtrl.text =
                            nameValue;
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Catatan Khusus',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          pemeriksaanIbuHamilbyPetugas
                              .StorePemeriksaanIbuByPetugas(
                                  ibu_hamil_id: int.parse(
                                      widget.petugasWithIbuHamilModel['id']));
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          )),
        )
      ],
    );
  }
}
