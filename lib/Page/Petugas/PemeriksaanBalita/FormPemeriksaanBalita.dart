import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/MasterData/DokterController.dart';
import 'package:posyandu/Controller/MasterData/VaksinController.dart';
import 'package:posyandu/Controller/MasterData/VitaminController.dart';
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
  var dokterController = Get.put(DokterController());
  var vitaminController = Get.put(VitaminController());
  var umur = Get.put(DetailKeluargaController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String? dokter_id;

  TextEditingController nama_lengkap = TextEditingController();
  // TextEditingController tanggal_pemeriksaan = TextEditingController();

  @override
  void initState() {
    super.initState();
    nama_lengkap.text = widget.petugasWithBalitaModel['nama_lengkap'];
    pemeriksaanBalitaByPetugas.tanggal_pemeriksaan.text =
        DateFormat('y-M-d').format(DateTime.now()).toString();
    umur.GetUmur(widget.petugasWithBalitaModel['detail_keluarga_id'])
        .whenComplete(() => pemeriksaanBalitaByPetugas.umur_balita.text =
            umur.umurPeserta.value.usiaBulan!.toString());

    dokterController.getDokter();
    vitaminController.getVitamin();
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
            leading: BackButton(
              onPressed: () {
                pemeriksaanBalitaByPetugas.resetForm();
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
                          tanggal = pemeriksaanBalitaByPetugas
                              .tanggal_pemeriksaan.text;
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextFormField(
                              readOnly: true,
                              controller:
                                  pemeriksaanBalitaByPetugas.umur_balita,
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
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text("Bulan")
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
                                  controller: pemeriksaanBalitaByPetugas.berat,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanBalitaByPetugas.berat.text =
                                        nameValue;
                                    return null;
                                  },
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
                                ),
                              ),
                              Text("Kg"),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: pemeriksaanBalitaByPetugas.tinggi,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanBalitaByPetugas.tinggi.text =
                                        nameValue;
                                    return null;
                                  },
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
                                ),
                              ),
                              Text("Cm")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller:
                                      pemeriksaanBalitaByPetugas.lingkar_kepala,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanBalitaByPetugas
                                        .lingkar_kepala.text = nameValue;
                                    return null;
                                  },
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
                              ),
                              Text("Cm"),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller:
                                      pemeriksaanBalitaByPetugas.lingkar_lengan,
                                  keyboardType: TextInputType.number,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    pemeriksaanBalitaByPetugas
                                        .lingkar_lengan.text = nameValue;
                                    return null;
                                  },
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
                              ),
                              Text("Cm")
                            ],
                          )
                        ],
                      ),
                    ),

                    TextFormField(
                      controller: pemeriksaanBalitaByPetugas.keluhan,
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanBalitaByPetugas.keluhan.text = nameValue;
                        return null;
                      },
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
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanBalitaByPetugas.penanganan.text = nameValue;
                        return null;
                      },
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
                      validator: (nameValue) {
                        if (nameValue!.isEmpty) {
                          return 'Mohon masukan data';
                        }
                        pemeriksaanBalitaByPetugas.catatan.text = nameValue;
                        return null;
                      },
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
                    Obx(() => dokterController.isLoading.value
                        ? CircularProgressIndicator()
                        : LayoutBuilder(builder: (context, constraint) {
                            // List<String> itemStringList = ["Female", "Male"];

                            return FormField(
                              initialValue: false,
                              enabled: true,
                              builder: (FormFieldState<bool> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: "Dokter",
                                    errorText: field.errorText,
                                    // helperText: "Your gender",
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: false,
                                      child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: pemeriksaanBalitaByPetugas
                                                      .dokter_id ==
                                                  null
                                              ? null
                                              : pemeriksaanBalitaByPetugas
                                                  .dokter_id
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
                                              pemeriksaanBalitaByPetugas
                                                      .dokter_id =
                                                  int.parse(newValue!);
                                            });
                                          },
                                          hint: Text("Pilih Dokter"),
                                          items: [
                                            for (var data in dokterController
                                                .listDokter.value)
                                              DropdownMenuItem(
                                                child: new Text(
                                                  data.namaDokter!,
                                                ),
                                                value: data.id.toString(),
                                              )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                            );
                          })),
                    Obx(() => dokterController.isLoading.value
                        ? CircularProgressIndicator()
                        : LayoutBuilder(builder: (context, constraint) {
                            // List<String> itemStringList = ["Female", "Male"];

                            return FormField(
                              initialValue: false,
                              enabled: true,
                              builder: (FormFieldState<bool> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: "Vitamin",
                                    errorText: field.errorText,
                                    // helperText: "Your gender",
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: false,
                                      child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: pemeriksaanBalitaByPetugas
                                                      .vitamin_id ==
                                                  null
                                              ? null
                                              : pemeriksaanBalitaByPetugas
                                                  .vitamin_id
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
                                              pemeriksaanBalitaByPetugas
                                                      .vitamin_id =
                                                  int.parse(newValue!);
                                            });
                                          },
                                          hint: Text("Pilih Dokter"),
                                          items: [
                                            for (var data in vitaminController
                                                .listVitamin.value)
                                              DropdownMenuItem(
                                                child: new Text(
                                                  data.namaVitamin!,
                                                ),
                                                value: data.id.toString(),
                                              )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                            );
                          })),
                    // TextFormField(
                    //   controller: pemeriksaanBalitaByPetugas.dokter_id,
                    //   maxLength: 200,
                    //   maxLines: 4,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Dokter',
                    //     labelStyle: TextStyle(
                    //       color: Colors.blueGrey,
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.blueGrey,
                    //       ),
                    //     ),
                    //   ),
                    //   // onChanged: (value) {},
                    // ),
                    // TextFormField(
                    //   controller: pemeriksaanBalitaByPetugas.vitamin_id,
                    //   maxLength: 200,
                    //   maxLines: 4,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Vitamin',
                    //     labelStyle: TextStyle(
                    //       color: Colors.blueGrey,
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.blueGrey,
                    //       ),
                    //     ),
                    //   ),
                    //   // onChanged: (value) {},
                    // ),

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
                        if (_form.currentState!.validate()) {
                          var listVaksin = Get.put(VaksinController());
                          pemeriksaanBalitaByPetugas
                              .StorePemeriksaanBalitaByPetugas(
                                  vaksins: listVaksin.data,
                                  balita_id:
                                      widget.petugasWithBalitaModel["id"]);
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
