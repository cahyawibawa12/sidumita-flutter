import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';

class BiodataIbuHamil extends StatefulWidget {
  BiodataIbuHamil({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<BiodataIbuHamil> createState() => _BiodataIbuHamilState();
}

class _BiodataIbuHamilState extends State<BiodataIbuHamil> {
  var detailKeluarga = Get.put(DetailKeluargaController());
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    detailKeluarga.nama_lengkap.text =
        widget.ibuHamilModel.detailKeluarga!.namaLengkap.toString();
    detailKeluarga.det_nik.text =
        widget.ibuHamilModel.detailKeluarga!.nik.toString();
    detailKeluarga.tempat_lahir.text =
        widget.ibuHamilModel.detailKeluarga!.tempatLahir.toString();
    detailKeluarga.tanggal_lahir.text = DateFormat('dd MMMM yyyy').format(
        DateTime.parse(
            widget.ibuHamilModel.detailKeluarga!.tanggalLahir.toString()));
    detailKeluarga.agama.text =
        widget.ibuHamilModel.detailKeluarga!.agama.toString();
    detailKeluarga.no_telp.text =
        widget.ibuHamilModel.detailKeluarga!.noTelp.toString();
    detailKeluarga.jenis_pekerjaan.text =
        widget.ibuHamilModel.detailKeluarga!.jenisPekerjaan.toString();
    detailKeluarga.kewarganegaraan.text =
        widget.ibuHamilModel.detailKeluarga!.kewarganegaraan.toString();
    detailKeluarga.jenis_kelamins.text =
        widget.ibuHamilModel.detailKeluarga!.jenisKelamin.toString();
    detailKeluarga.golongan_darahs.text =
        widget.ibuHamilModel.detailKeluarga!.golonganDarah.toString();
    detailKeluarga.status_perkawinan =
        widget.ibuHamilModel.detailKeluarga!.statusPerkawinan.toString();
    detailKeluarga.status_keluarga =
        widget.ibuHamilModel.detailKeluarga!.statusDalamKeluarga.toString();
    detailKeluarga.pendidikan.text =
        widget.ibuHamilModel.detailKeluarga!.pendidikan.toString();

    // umur.GetUmur(widget.ibuHamilModel.detailKeluarga!.id!);
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
                        widget.ibuHamilModel.detailKeluarga!.namaLengkap
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        umur.umurPeserta.value.umur.toString() +
                            " Tahun " +
                            (umur.umurPeserta.value.usiaBulan! % 12)
                                .toString() +
                            " Bulan",
                      ),
                    ),
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
                          controller: detailKeluarga.agama,
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
