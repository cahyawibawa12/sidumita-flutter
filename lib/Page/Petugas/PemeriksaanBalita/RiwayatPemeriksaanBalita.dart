import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/PetugasWithBalitaModel.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/DetailRiwayatBalita.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/FormPemeriksaanBalita.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/ImunisasiBalitaPetugasPage.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/StatistikBalitaPetugas.dart';
import 'package:intl/intl.dart';

import 'package:posyandu/widget/BackgroundImage.dart';

class RiwayatPemeriksaanBalita extends StatefulWidget {
  RiwayatPemeriksaanBalita({super.key, required this.petugasWithBalitaModel});

  final Map petugasWithBalitaModel;

  @override
  State<RiwayatPemeriksaanBalita> createState() =>
      _RiwayatPemeriksaanBalitaState();
}

class _RiwayatPemeriksaanBalitaState extends State<RiwayatPemeriksaanBalita> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    pemeriksaanbalita
        .getPemeriksaanBalita(int.parse(widget.petugasWithBalitaModel["id"]));
    umur.GetUmur(int.parse(widget.petugasWithBalitaModel["id"]));
    print('from page ' +
        pemeriksaanbalita.listPemeriksaanBalita.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        pemeriksaanbalita.getPemeriksaanBalita(
            int.parse(widget.petugasWithBalitaModel["id"]));
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Riwayat Balita"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPemeriksaanBalita(
                                      petugasWithBalitaModel:
                                          widget.petugasWithBalitaModel)));
                        },
                        child: Text(
                          "Tambah Data",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StatistikBalitaPetugas(
                                    petugasWithBalitaModel:
                                        widget.petugasWithBalitaModel,
                                  )));
                        },
                        child: const Text("Statistik"),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImunisasiBalitaPetugasPage(
                                    petugasWithBalitaModel:
                                        widget.petugasWithBalitaModel,
                                  )));
                        },
                        child: const Text("Imunisasi"),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Tanggal"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text("Berat"),
                          Text("(Kg)"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Tinggi"),
                          Text("(Cm)"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Lingkar Kepala"),
                          Text("(Cm)"),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() => pemeriksaanbalita.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
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
                                    pemeriksaanbalita
                                        .deletePemeriksaanBalita(
                                            pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .id)
                                        .then((value) => pemeriksaanbalita
                                            .getPemeriksaanBalita(int.parse(
                                                widget.petugasWithBalitaModel[
                                                    "id"])));
                                    return Future.value(true);
                                  }
                                  return Future.value(false);
                                },
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 3),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                14.5,
                                      ),
                                      Text(DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(pemeriksaanbalita
                                              .listPemeriksaanBalita[index]
                                              .tanggalPemeriksaan))),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                      ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .beratBadan
                                          .toString()),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                      ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .tinggiBadan
                                          .toString()),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                      ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .lingkarKepala
                                          .toString()),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailRiwayatBalita(
                                                    id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .id,
                                                    tanggal_pemeriksaan:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .tanggalPemeriksaan,
                                                    umur_balita: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .umurBalita,
                                                    lingkar_kepala:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .lingkarKepala
                                                            .toString(),
                                                    lingkar_lengan:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .lingkarLengan
                                                            .toString(),
                                                    berat_badan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .beratBadan
                                                        .toString(),
                                                    tinggi_badan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .tinggiBadan
                                                        .toString(),
                                                    keluhan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .keluhan,
                                                    penanganan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .penanganan,
                                                    catatan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .catatan,
                                                    balita_id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .balitaId
                                                        .toString(),
                                                    petugas_kesehatan_id:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .petugasKesehatanId
                                                            .toString(),
                                                    dokter_id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .dokterId
                                                        .toString()
                                                        .toString(),
                                                    vitamin_id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .vitaminId
                                                        .toString(),
                                                  ),
                                                ));
                                          },
                                          icon: const Icon(
                                            Icons.search,
                                            size: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                pemeriksaanbalita.listPemeriksaanBalita.length,
                          ),
                        )),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
