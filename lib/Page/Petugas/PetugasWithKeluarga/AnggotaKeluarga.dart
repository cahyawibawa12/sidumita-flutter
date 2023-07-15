import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Model/PetugasWithKeluargaModel.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/FormAnggotaPeserta.dart';
import 'package:posyandu/Page/Petugas/PetugasWithKeluarga/DetailKeluarga.dart';
import 'package:posyandu/Page/Petugas/PetugasWithKeluarga/TambahAnggotaKeluarga.dart';

import '../../../widget/BackgroundImage.dart';

class AnggotaKeluarga extends StatefulWidget {
  AnggotaKeluarga({super.key, required this.petugasWithKeluargaModel});
  final Map petugasWithKeluargaModel;

  @override
  State<AnggotaKeluarga> createState() => _AnggotaKeluargaState();
}

class _AnggotaKeluargaState extends State<AnggotaKeluarga> {
  var petugasWithDetailKeluarga = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    petugasWithDetailKeluarga.showDetailKeluargaForPetugas(
        int.parse(widget.petugasWithKeluargaModel["id"]));
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        petugasWithDetailKeluarga.showDetailKeluargaForPetugas(
            int.parse(widget.petugasWithKeluargaModel["id"]));
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Positioned(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text("Anggota Keluarga"),
                  backgroundColor: Color(0xff34BE82),
                ),
                body: Obx(
                  () => petugasWithDetailKeluarga.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  TextFormField(
                                    readOnly: true,
                                    initialValue:
                                        widget.petugasWithKeluargaModel[
                                            "no_kartu_keluarga"],
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      labelText: 'NIK',
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
                                    initialValue:
                                        widget.petugasWithKeluargaModel[
                                            "kepala_keluarga"],
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      labelText: 'Nama Kepala Keluarga',
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
                                    initialValue: widget
                                        .petugasWithKeluargaModel["alamat"],
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
                                    ),
                                    onChanged: (value) {},
                                  ),
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: petugasWithDetailKeluarga
                                        .listPetugasWithDetailKeluarga.length
                                        .toString(),
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah',
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 64,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TambahAnggotaKeluarga(
                                                  petugasWithKeluargaModel: widget
                                                      .petugasWithKeluargaModel)));
                                },
                                child: Text("Tambah Data Keluarga"),
                              ),
                            ),
                            ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              // margin: EdgeInsets.only(left: 20, right: 20),
                              itemCount: petugasWithDetailKeluarga
                                  .listPetugasWithDetailKeluarga.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(petugasWithDetailKeluarga
                                        .listPetugasWithDetailKeluarga[index]
                                        .namaLengkap
                                        .toString()),
                                    subtitle: Text(petugasWithDetailKeluarga
                                        .listPetugasWithDetailKeluarga[index]
                                        .nik
                                        .toString()),
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              DetailKeluargaForPetugas(
                                                  petugasWithDetailKeluargaModel:
                                                      petugasWithDetailKeluarga
                                                              .listPetugasWithDetailKeluarga[
                                                          index])));
                                    },
                                  ),
                                );
                              },
                            ),
                          ]),
                        ),
                )),
          )
        ],
      ),
    );
  }
}
