import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';

import '../../../Model/DetailKeluargaModel.dart';
import '../../../widget/widgets.dart';

class EditPeserta extends StatefulWidget {
  EditPeserta({super.key, required this.detailKeluargaModel});

  DetailKeluargaModel detailKeluargaModel;

  @override
  State<EditPeserta> createState() => _EditPesertaState();
}

class _EditPesertaState extends State<EditPeserta> {
  var detailKeluarga = Get.put(DetailKeluargaController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    detailKeluarga.nama_lengkap.text =
        widget.detailKeluargaModel.namaLengkap.toString();
    detailKeluarga.det_nik.text = widget.detailKeluargaModel.nik.toString();
    detailKeluarga.tempat_lahir.text =
        widget.detailKeluargaModel.tempatLahir.toString();
    detailKeluarga.tanggal_lahir.text =
        widget.detailKeluargaModel.tanggalLahir.toString();
    detailKeluarga.agama.text = widget.detailKeluargaModel.agama.toString();
    detailKeluarga.no_telp.text = widget.detailKeluargaModel.noTelp.toString();
    detailKeluarga.jenis_pekerjaan.text =
        widget.detailKeluargaModel.jenisPekerjaan.toString();
    detailKeluarga.kewarganegaraan.text =
        widget.detailKeluargaModel.kewarganegaraan.toString();
    detailKeluarga.jenis_kelamin =
        widget.detailKeluargaModel.jenisKelamin.toString();
    detailKeluarga.golongan_darah =
        widget.detailKeluargaModel.golonganDarah.toString();
    detailKeluarga.status_perkawinan =
        widget.detailKeluargaModel.statusPerkawinan.toString();
    detailKeluarga.status_keluarga =
        widget.detailKeluargaModel.statusDalamKeluarga.toString();
    detailKeluarga.pendidikan.text =
        widget.detailKeluargaModel.pendidikan.toString();
    // detailKeluarga.StoreDetailKeluarga();
  }

  @override
  void dispose() {
    // Get.delete<DetailKeluargaController>();
    super.dispose();
  }

  var tanggal = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Tambah Anggota Keluarga",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _form,
                          child: Column(
                            children: [
                              TextFormField(
                                maxLength: 50,
                                // initialValue:
                                //     widget.detailKeluargaModel.namaLengkap,
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
                                ),
                                controller: detailKeluarga.nama_lengkap,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.nama_lengkap.text = nameValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                maxLength: 16,
                                keyboardType: TextInputType.number,
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
                                controller: detailKeluarga.det_nik,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.det_nik.text = nameValue;
                                  return null;
                                },
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Perempuan",
                                  "Laki-Laki"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: "Jenis Kelamin",
                                        errorText: field.errorText,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: false,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: detailKeluarga.jenis_kelamin,
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
                                                detailKeluarga.jenis_kelamin =
                                                    newValue!;
                                              });
                                            },
                                            items: itemStringList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 0.0,
                                                    vertical: 0.0,
                                                  ),
                                                  child: Text(
                                                    value,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                              TextFormField(
                                maxLength: 20,
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
                                controller: detailKeluarga.tempat_lahir,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.tempat_lahir.text = nameValue;
                                  return null;
                                },
                              ),
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  );
                                  setState(() {
                                    tanggal = detailKeluarga.tanggal_lahir.text;
                                    detailKeluarga.tanggal_lahir.text =
                                        DateFormat('y-M-d').format(pickedDate!);
                                  });
                                  tanggal =
                                      DateFormat('y-M-d').format(pickedDate!);
                                  print("pickedDate: $tanggal");
                                },
                                child: TextFormField(
                                  controller: detailKeluarga.tanggal_lahir,
                                  validator: (nameValue) {
                                    if (nameValue!.isEmpty) {
                                      return 'Mohon masukan data';
                                    }
                                    detailKeluarga.tanggal_lahir.text =
                                        nameValue;
                                    return null;
                                  },
                                  maxLength: 20,
                                  enabled: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Birth date',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    suffixIcon: Icon(Icons.date_range),
                                  ),
                                  // onChanged: (value) {},
                                ),
                              ),
                              TextFormField(
                                maxLength: 20,
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
                                ),
                                controller: detailKeluarga.agama,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.agama.text = nameValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 13,
                                decoration: const InputDecoration(
                                  labelText: 'No Telp',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                controller: detailKeluarga.no_telp,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.no_telp.text = nameValue;
                                  return null;
                                },
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "A",
                                  "B",
                                  "AB",
                                  "O"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: "Golongan Darah",
                                        errorText: field.errorText,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: false,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value:
                                                detailKeluarga.golongan_darah,
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
                                                detailKeluarga.golongan_darah =
                                                    newValue!;
                                              });
                                            },
                                            items: itemStringList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 0.0,
                                                    vertical: 0.0,
                                                  ),
                                                  child: Text(
                                                    value,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                              TextFormField(
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  labelText: 'Jenis Pekerjaan',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                controller: detailKeluarga.jenis_pekerjaan,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.jenis_pekerjaan.text =
                                      nameValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  labelText: 'Pendidikan Terakhir',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                controller: detailKeluarga.pendidikan,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.pendidikan.text = nameValue;
                                  return null;
                                },
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Menikah",
                                  "Belum Menikah"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: "Status Perkawinan",
                                        errorText: field.errorText,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: false,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: detailKeluarga
                                                .status_perkawinan,
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
                                                detailKeluarga
                                                        .status_perkawinan =
                                                    newValue!;
                                              });
                                            },
                                            items: itemStringList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 0.0,
                                                    vertical: 0.0,
                                                  ),
                                                  child: Text(
                                                    value,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Anak",
                                  "Istri",
                                  "Kepala Keluarga",
                                  "Ayah",
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: "Status Dalam Keluarga",
                                        errorText: field.errorText,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: false,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value:
                                                detailKeluarga.status_keluarga,
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
                                                detailKeluarga.status_keluarga =
                                                    newValue!;
                                              });
                                            },
                                            items: itemStringList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 0.0,
                                                    vertical: 0.0,
                                                  ),
                                                  child: Text(
                                                    value,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                              TextFormField(
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  labelText: 'Kewarganegaraan',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                controller: detailKeluarga.kewarganegaraan,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.kewarganegaraan.text =
                                      nameValue;
                                  return null;
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  if (_form.currentState!.validate()) {
                                    detailKeluarga.UpdateDetailKeluarga(
                                        widget.detailKeluargaModel.id!);
                                  }
                                },
                                child: const Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
