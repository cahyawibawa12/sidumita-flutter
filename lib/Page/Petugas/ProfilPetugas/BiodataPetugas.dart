import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/DesaController.dart';
import 'package:posyandu/Controller/MasterData/DusunController.dart';
import 'package:posyandu/Controller/MasterData/KabupatenController.dart';
import 'package:posyandu/Controller/MasterData/KecamatanController.dart';
import 'package:posyandu/Controller/MasterData/Provinsi.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Model/PetugasModel.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/EditBiodataPetugas.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';

class BiodataPetugas extends StatefulWidget {
  const BiodataPetugas({super.key});

  // PetugasModel biodataPetugas;

  @override
  State<BiodataPetugas> createState() => _BiodataPetugasState();
}

class _BiodataPetugasState extends State<BiodataPetugas> {
  var bioPetugas = Get.put(PetugasController());

  String? provinsi_id, kabupaten_id, kecamatan_id, desa_id, dusun_id;

  @override
  void initState() {
    super.initState();
    bioPetugas.ShowPetugas();
    // bioPetugas.nama.text = widget.biodataPetugas.nama.toString();
    // bioPetugas.nik.text = widget.biodataPetugas.nik.toString();
    // bioPetugas.no_telp.text = widget.biodataPetugas.noTelp.toString();
    // bioPetugas.tempat_lahir.text = widget.biodataPetugas.tempatLahir.toString();
    // bioPetugas.tanggal_lahir.text =
    //     widget.biodataPetugas.tanggalLahir.toString();
    // bioPetugas.alamat.text = widget.biodataPetugas.alamat.toString();
    // bioPetugas.desa_id = widget.biodataPetugas.desaId?.toInt();
    // bioPetugas.dusun_id = widget.biodataPetugas.dusunId?.toInt();
    // bioPetugas.jenis_kelamin = widget.biodataPetugas.jenisKelamin;
    // bioPetugas.kecamatan_id = widget.biodataPetugas.kecamatanId?.toInt();
    // bioPetugas.kabupaten_id = widget.biodataPetugas.kabupatenId?.toInt();
    // bioPetugas.provinsi_id = widget.biodataPetugas.provinsiId!.toInt();
  }

  var tanggal = '';

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        bioPetugas.ShowPetugas();
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Biodata Petugas"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 160.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/jadwal-list.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => bioPetugas.isLoading.value
                    ? CircularProgressIndicator()
                    : Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama,
                              maxLength: 200,
                              decoration: const InputDecoration(
                                labelText: 'Nama Lengkap',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nik,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Nomor Induk Kependudukan',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                // suffixIcon: Icon(
                                //   Icons.format_list_numbered_rtl_sharp,
                                // ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                // helperText: 'Enter your email address',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.no_telp,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Nomor Telepon',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                suffixIcon: Icon(
                                  Icons.phone,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                // helperText: 'Enter your email address',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.tempat_lahir,
                              maxLength: 50,
                              decoration: const InputDecoration(
                                labelText: 'Tempat Lahir',
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
                            SizedBox(
                              height: 10,
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
                                  tanggal = bioPetugas.tanggal_lahir.text;
                                  bioPetugas.tanggal_lahir.text =
                                      DateFormat('y-M-d').format(pickedDate!);
                                });
                                tanggal =
                                    DateFormat('y-M-d').format(pickedDate!);
                                print("pickedDate: $tanggal");
                              },
                              child: TextFormField(
                                readOnly: true,
                                controller: bioPetugas.tanggal_lahir,
                                maxLength: 20,
                                enabled: false,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal Lahir',
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
                                // onChanged: (value) {},
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.jenis_kelamins,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Jenis Kelamin',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama_provinsi,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Provinsi',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama_kabupaten,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Kabupaten',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama_kecamatan,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Kecamatan',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama_desa,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Desa',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.nama_dusun,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Dusun',
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
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: bioPetugas.alamat,
                              maxLength: 200,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                labelText: 'Alamat',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                // helperText: "What's your address",
                              ),
                              onChanged: (value) {},
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditBiodataPetugas()));
                              },
                              child: const Text("Edit"),
                            ),
                          ],
                        ),
                      ))
              ]),
            )),
          )
        ],
      ),
    );
  }
}
