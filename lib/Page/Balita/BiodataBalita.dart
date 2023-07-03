import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BiodataBalita extends StatefulWidget {
  BiodataBalita({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<BiodataBalita> createState() => _BiodataBalitaState();
}

class _BiodataBalitaState extends State<BiodataBalita> {
  var detailKeluarga = Get.put(DetailKeluargaController());
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id');
    detailKeluarga.nama_lengkap.text =
        widget.balitaModel.detailKeluarga!.namaLengkap.toString();
    detailKeluarga.det_nik.text =
        widget.balitaModel.detailKeluarga!.nik.toString();
    detailKeluarga.tempat_lahir.text =
        widget.balitaModel.detailKeluarga!.tempatLahir.toString();
    detailKeluarga.tanggal_lahir.text = DateFormat('dd MMMM yyyy', "id").format(
        DateTime.parse(
            widget.balitaModel.detailKeluarga!.tanggalLahir.toString()));
    detailKeluarga.agama_controller.text =
        widget.balitaModel.detailKeluarga!.agama.toString();
    detailKeluarga.no_telp.text =
        widget.balitaModel.detailKeluarga!.noTelp.toString();
    detailKeluarga.jenis_pekerjaan.text =
        widget.balitaModel.detailKeluarga!.jenisPekerjaan.toString();
    detailKeluarga.kewarganegaraan.text =
        widget.balitaModel.detailKeluarga!.kewarganegaraan.toString();
    detailKeluarga.jenis_kelamins.text =
        widget.balitaModel.detailKeluarga!.jenisKelamin.toString();
    detailKeluarga.golongan_darahs.text =
        widget.balitaModel.detailKeluarga!.golonganDarah.toString();
    detailKeluarga.status_perkawinan =
        widget.balitaModel.detailKeluarga!.statusPerkawinan.toString();
    detailKeluarga.status_keluarga =
        widget.balitaModel.detailKeluarga!.statusDalamKeluarga.toString();
    detailKeluarga.pendidikan_controller.text =
        widget.balitaModel.detailKeluarga!.pendidikan.toString();

    // umur.GetUmur(widget.balitaModel.detailKeluarga!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromARGB(255, 185, 246, 188),
                    child: ListTile(
                        title: Text(
                          widget.balitaModel.detailKeluarga!.namaLengkap
                              .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: (() {
                          if (umur.umurPeserta.value.format.toString() ==
                              "tahun") {
                            return Text(
                              umur.umurPeserta.value.umur.toString() +
                                  " Tahun " +
                                  (umur.umurPeserta.value.usiaBulan! % 12)
                                      .toString() +
                                  " Bulan",
                            );
                          } else {
                            return Text(
                              "0 Tahun " +
                                  (umur.umurPeserta.value.usiaBulan! % 12)
                                      .toString() +
                                  " Bulan",
                            );
                          }
                        }())),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Nomor Induk Keluarga',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          controller: detailKeluarga.det_nik,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: detailKeluarga.tempat_lahir,
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
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
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
                          ),
                          controller: detailKeluarga.tanggal_lahir,
                        ),
                        TextFormField(
                          // maxLength: 20,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Agama',
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
                          controller: detailKeluarga.agama_controller,
                        ),
                        TextFormField(
                          // maxLength: 20,
                          readOnly: true,
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
                            // helperText: "What's your name?",
                          ),
                          controller: detailKeluarga.jenis_kelamins,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Golongan Darah',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          controller: detailKeluarga.golongan_darahs,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
