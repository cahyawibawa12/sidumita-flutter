import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/VaksinController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/PetugasWithBalitaModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:posyandu/widget/CheckBoxVaksin.dart';
import 'package:intl/intl.dart';

class FormPemeriksaanBalita extends StatefulWidget {
  FormPemeriksaanBalita({super.key, required this.petugasWithBalitaModel});
  final Map petugasWithBalitaModel;

  @override
  State<FormPemeriksaanBalita> createState() => _FormPemeriksaanBalitaState();
}

class _FormPemeriksaanBalitaState extends State<FormPemeriksaanBalita> {
  bool _checkBoxVal = true;
  var pemeriksaanBalitaByPetugas = Get.put(PemeriksaanBalitaController());

  TextEditingController nama_lengkap = TextEditingController();
  // TextEditingController tanggal_pemeriksaan = TextEditingController();

  @override
  void initState() {
    super.initState();
    nama_lengkap.text = widget.petugasWithBalitaModel['nama_lengkap'];
    pemeriksaanBalitaByPetugas.tanggal_pemeriksaan.text =
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
            title: Text("Create Pemeriksaan Balita"),
            backgroundColor: Color(0xff34BE82),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  TextFormField(
                    controller: nama_lengkap,
                    decoration: const InputDecoration(
                      labelText: 'Name',
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
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        tanggal =
                            pemeriksaanBalitaByPetugas.tanggal_pemeriksaan.text;
                        pemeriksaanBalitaByPetugas.tanggal_pemeriksaan.text =
                            DateFormat('y-M-d').format(pickedDate!);
                      });
                      tanggal = DateFormat('y-M-d').format(pickedDate!);
                      print("pickedDate: $tanggal");
                    },
                    child: TextFormField(
                      controller:
                          pemeriksaanBalitaByPetugas.tanggal_pemeriksaan,
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
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.umur_balita,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Umur',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.numbers_outlined,
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      // helperText: 'Enter your email address',
                    ),
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.berat,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Berat',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.numbers_rounded,
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      // helperText: 'Enter your email address',
                    ),
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.tinggi,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Tinggi',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.numbers_rounded,
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      // helperText: 'Enter your email address',
                    ),
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.lingkar_kepala,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Lingkar Kepala',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.numbers_rounded,
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      // helperText: 'Enter your email address',
                    ),
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.lingkar_lengan,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Lingkar Lengan',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.numbers_rounded,
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      // helperText: 'Enter your email address',
                    ),
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.keluhan,
                    maxLength: 200,
                    maxLines: 4,
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
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.penanganan,
                    maxLength: 200,
                    maxLines: 4,
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
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.catatan,
                    maxLength: 200,
                    maxLines: 4,
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
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.dokter_id,
                    maxLength: 200,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Dokter',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    // onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: pemeriksaanBalitaByPetugas.vitamin_id,
                    maxLength: 200,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Vitamin',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    // onChanged: (value) {},
                  ),

                  CheckBoxVaksin(),

                  const SizedBox(
                    width: 20,
                  ),
                  // Text(
                  //   "Checkbox : $_checkBoxVal",
                  //   style: const TextStyle(fontSize: 25),
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      var listVaksin = Get.put(VaksinController());
                      pemeriksaanBalitaByPetugas
                          .StorePemeriksaanBalitaByPetugas(
                              vaksins: listVaksin.data,
                              balita_id: widget.petugasWithBalitaModel["id"]);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          )),
        )
      ],
    );
  }
}
