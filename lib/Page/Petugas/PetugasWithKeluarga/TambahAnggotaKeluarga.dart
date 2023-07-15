import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';

import '../../../widget/widgets.dart';

class TambahAnggotaKeluarga extends StatefulWidget {
  TambahAnggotaKeluarga({super.key, required this.petugasWithKeluargaModel});
  final Map petugasWithKeluargaModel;

  @override
  State<TambahAnggotaKeluarga> createState() => _TambahAnggotaKeluargaState();
}

class _TambahAnggotaKeluargaState extends State<TambahAnggotaKeluarga> {
  var detailKeluarga = Get.put(DetailKeluargaController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // detailKeluarga.StoreDetailKeluarga();
    detailKeluarga.resetForm();
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 185, 246, 188)),
                      child: Center(
                        child: Text("Tambah Data Keluarga",
                            style: GoogleFonts.gentiumBasic(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
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
                                    } else if (nameValue.length < 16) {
                                      return 'Masukkan NIK dengan Benar';
                                    }
                                    if (nameValue.contains(",") ||
                                        nameValue.contains(".")) {
                                      return 'Masukkan NIK dengan Benar';
                                    }
                                    detailKeluarga.det_nik.text = nameValue;
                                    return null;
                                  }),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Perempuan",
                                  "Laki-Laki"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Jenis Kelamin",
                                            errorText: field.errorText,
                                          ),
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga.jenis_kelamin =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
                              ),
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
                                    lastDate: DateTime.now(),
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
                                  readOnly: true,
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
                                  ),
                                  // onChanged: (value) {},
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 13,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  }
                                  detailKeluarga.no_telp.text = nameValue;
                                  return null;
                                },
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
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Hindu",
                                  "Budha",
                                  "Islam",
                                  "Kristen",
                                  "Kristen Katolik",
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Agama",
                                            errorText: field.errorText,
                                          ),
                                          isExpanded: true,
                                          value: detailKeluarga.agama,
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga.agama = newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
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
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Golongan Darah",
                                            errorText: field.errorText,
                                          ),
                                          isExpanded: true,
                                          value: detailKeluarga.golongan_darah,
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga.golongan_darah =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "SD",
                                  "SMP",
                                  "SMA",
                                  "S1",
                                  "S2",
                                  "S3",
                                  "Belum"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Pendidikan Terakhir",
                                            errorText: field.errorText,
                                          ),
                                          isExpanded: true,
                                          value: detailKeluarga
                                              .pendidikan_terakhir,
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga
                                                      .pendidikan_terakhir =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Kawin",
                                  "Belum Kawin",
                                  "Janda",
                                  "Duda"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Status Perkawinan",
                                            errorText: field.errorText,
                                          ),
                                          isExpanded: true,
                                          value:
                                              detailKeluarga.status_perkawinan,
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga.status_perkawinan =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              LayoutBuilder(builder: (context, constraint) {
                                List<String> itemStringList = [
                                  "Anak",
                                  "Istri",
                                  "Kepala Keluarga"
                                ];

                                return FormField(
                                  initialValue: false,
                                  enabled: true,
                                  builder: (FormFieldState<bool> field) {
                                    return DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            labelText: "Status Dalam Keluarga",
                                            errorText: field.errorText,
                                          ),
                                          isExpanded: true,
                                          value: detailKeluarga.status_keluarga,
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
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              detailKeluarga.status_keluarga =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Mohon Masukan Data'
                                              : null,
                                          items: itemStringList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                maxLength: 20,
                                validator: (nameValue) {
                                  if (nameValue!.isEmpty) {
                                    return 'Mohon masukan data';
                                  } else {
                                    detailKeluarga.jenis_pekerjaan.text =
                                        nameValue;
                                    return null;
                                  }
                                },
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
                              ),
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
                                  } else {
                                    detailKeluarga.kewarganegaraan.text =
                                        nameValue;
                                    return null;
                                  }
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  if (_form.currentState!.validate()) {
                                    detailKeluarga.StoreDetailKeluargaByPetugas(
                                        int.parse(widget
                                            .petugasWithKeluargaModel["id"]));
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
