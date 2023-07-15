import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Model/PetugasWithDetailKeluargaModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailKeluargaForPetugas extends StatefulWidget {
  DetailKeluargaForPetugas(
      {super.key, required this.petugasWithDetailKeluargaModel});
  PetugasWithDetailKeluargaModel petugasWithDetailKeluargaModel;

  @override
  State<DetailKeluargaForPetugas> createState() =>
      _DetailKeluargaForPetugasState();
}

class _DetailKeluargaForPetugasState extends State<DetailKeluargaForPetugas> {
  void initstate() {
    initializeDateFormatting('id');
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
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 185, 246, 188)),
                          child: Center(
                            child: Text("Data Anggota Keluarga",
                                style: GoogleFonts.gentiumBasic(
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Nama Lengkap"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .namaLengkap
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Jenis Kelamin"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .jenisKelamin
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(111, 23, 196, 98)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Tempat Lahir"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(widget
                                              .petugasWithDetailKeluargaModel
                                              .tempatLahir
                                              .toString())
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(111, 23, 196, 98)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Tanggal Lahir"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(DateFormat('dd MMMM yyyy')
                                              .format(DateTime.parse(widget
                                                  .petugasWithDetailKeluargaModel
                                                  .tanggalLahir
                                                  .toString())))
                                        ]),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Agama"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget
                                          .petugasWithDetailKeluargaModel.agama
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Pendidikan"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .pendidikan
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Golongan Darah"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .golonganDarah
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Pekerjaan"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .jenisPekerjaan
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Status Perkawinan"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .statusPerkawinan
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Status Dalam Keluarga"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .statusDalamKeluarga
                                          .toString())
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(111, 23, 196, 98)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Kewarganegaraan"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.petugasWithDetailKeluargaModel
                                          .kewarganegaraan
                                          .toString())
                                    ]),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }
}
