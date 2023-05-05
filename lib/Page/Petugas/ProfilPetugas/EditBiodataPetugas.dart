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
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';

class EditBiodataPetugas extends StatefulWidget {
  const EditBiodataPetugas({super.key});

  // PetugasModel biodataPetugas;

  @override
  State<EditBiodataPetugas> createState() => _EditBiodataPetugasState();
}

class _EditBiodataPetugasState extends State<EditBiodataPetugas> {
  var bioPetugas = Get.put(PetugasController());
  var provinsi = Get.put(ProvinsiController());
  var kabupaten = Get.put(KabupatenController());
  var kecamatan = Get.put(KecamatanController());
  var desa = Get.put(DesaController());
  var dusun = Get.put(DusunController());

  String? provinsi_id, kabupaten_id, kecamatan_id, desa_id, dusun_id;

  @override
  void initState() {
    super.initState();
    bioPetugas.ShowPetugas().then((value) {
      if (bioPetugas.kabupaten_id != null) {
        kabupaten.fetchProvinsi(provinsi_id: bioPetugas.provinsi_id);
      }
      if (bioPetugas.kecamatan_id != null) {
        kecamatan.fetchKabupaten(kabupaten_id: bioPetugas.kabupaten_id);
      }
      if (bioPetugas.desa_id != null) {
        desa.fetchKecamatan(kecamatan_id: bioPetugas.kecamatan_id);
      }
      if (bioPetugas.dusun_id != null) {
        dusun.fetchDesa(desa_id: bioPetugas.desa_id);
      }
    });
    provinsi.getProvinsi();
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
              title: Text("Edit Biodata Petugas"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10,
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
                            TextFormField(
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
                            LayoutBuilder(builder: (context, constraint) {
                              List<String> itemStringList = [
                                "Laki-Laki",
                                "Perempuan"
                              ];

                              return FormField(
                                initialValue: false,
                                enabled: true,
                                builder: (FormFieldState<bool> field) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: "Jenis Kelamin",
                                      errorText: field.errorText,
                                      // helperText: "Your gender",
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: false,
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: bioPetugas.jenis_kelamin,
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
                                              bioPetugas.jenis_kelamin =
                                                  newValue!;
                                            });
                                          },
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
                                    ),
                                  );
                                },
                              );
                            }),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => provinsi.isLoading.value
                                ? CircularProgressIndicator()
                                : LayoutBuilder(builder: (context, constraint) {
                                    // List<String> itemStringList = ["Female", "Male"];

                                    return FormField(
                                      initialValue: false,
                                      enabled: true,
                                      builder: (FormFieldState<bool> field) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Provinsi",
                                            errorText: field.errorText,
                                            // helperText: "Your gender",
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: false,
                                              child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: provinsi_id == null
                                                      ? null
                                                      : provinsi_id,
                                                  icon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
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
                                                    fontFamily:
                                                        Theme.of(context)
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
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      provinsi_id = newValue!;
                                                      bioPetugas.provinsi_id =
                                                          int.parse(newValue)!;
                                                      kabupaten.fetchProvinsi(
                                                          provinsi_id:
                                                              int.parse(
                                                                  newValue!));
                                                    });
                                                  },
                                                  items: [
                                                    for (var data in provinsi
                                                        .listProvinsi.value)
                                                      DropdownMenuItem(
                                                        child: new Text(
                                                          data.namaProvinsi!,
                                                        ),
                                                        value:
                                                            data.id.toString(),
                                                      )
                                                  ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => kabupaten.isLoading.value
                                ? CircularProgressIndicator()
                                : LayoutBuilder(builder: (context, constraint) {
                                    // List<String> itemStringList = ["Female", "Male"];

                                    return FormField(
                                      initialValue: false,
                                      enabled: true,
                                      builder: (FormFieldState<bool> field) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Kabupaten",
                                            errorText: field.errorText,
                                            // helperText: "Your gender",
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: false,
                                              child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: kabupaten_id == null
                                                      ? null
                                                      : kabupaten_id,
                                                  icon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
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
                                                    fontFamily:
                                                        Theme.of(context)
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
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      kabupaten_id = newValue!;
                                                      bioPetugas.kabupaten_id =
                                                          int.parse(newValue)!;
                                                      kecamatan.fetchKabupaten(
                                                          kabupaten_id:
                                                              int.parse(
                                                                  newValue));
                                                    });
                                                  },
                                                  items: [
                                                    for (var data in kabupaten
                                                        .listKabupaten.value)
                                                      DropdownMenuItem(
                                                        child: new Text(
                                                          data.namaKabupaten!,
                                                        ),
                                                        value:
                                                            data.id.toString(),
                                                      )
                                                  ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => kecamatan.isLoading.value
                                ? CircularProgressIndicator()
                                : LayoutBuilder(builder: (context, constraint) {
                                    // List<String> itemStringList = ["Female", "Male"];

                                    return FormField(
                                      initialValue: false,
                                      enabled: true,
                                      builder: (FormFieldState<bool> field) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Kecamatan",
                                            errorText: field.errorText,
                                            // helperText: "Your gender",
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: false,
                                              child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: kecamatan_id == null
                                                      ? null
                                                      : kecamatan_id,
                                                  icon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
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
                                                    fontFamily:
                                                        Theme.of(context)
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
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      kecamatan_id = newValue!;
                                                      bioPetugas.kecamatan_id =
                                                          int.parse(newValue)!;
                                                      desa.fetchKecamatan(
                                                          kecamatan_id:
                                                              int.parse(
                                                                  newValue));
                                                    });
                                                  },
                                                  items: [
                                                    for (var data in kecamatan
                                                        .listKecamatan.value)
                                                      DropdownMenuItem(
                                                        child: new Text(
                                                          data.namaKecamatan!,
                                                        ),
                                                        value:
                                                            data.id.toString(),
                                                      )
                                                  ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => desa.isLoading.value
                                ? CircularProgressIndicator()
                                : LayoutBuilder(builder: (context, constraint) {
                                    // List<String> itemStringList = ["Female", "Male"];

                                    return FormField(
                                      initialValue: false,
                                      enabled: true,
                                      builder: (FormFieldState<bool> field) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Desa",
                                            errorText: field.errorText,
                                            // helperText: "Your gender",
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: false,
                                              child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: desa_id == null
                                                      ? null
                                                      : desa_id,
                                                  icon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
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
                                                    fontFamily:
                                                        Theme.of(context)
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
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      desa_id = newValue!;
                                                      bioPetugas.desa_id =
                                                          int.parse(newValue)!;
                                                      dusun.fetchDesa(
                                                          desa_id: int.parse(
                                                              newValue));
                                                    });
                                                  },
                                                  items: [
                                                    for (var data
                                                        in desa.listDesa.value)
                                                      DropdownMenuItem(
                                                        child: new Text(
                                                          data.namaDesa!,
                                                        ),
                                                        value:
                                                            data.id.toString(),
                                                      )
                                                  ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => dusun.isLoading.value
                                ? CircularProgressIndicator()
                                : LayoutBuilder(builder: (context, constraint) {
                                    // List<String> itemStringList = ["Female", "Male"];

                                    return FormField(
                                      initialValue: false,
                                      enabled: true,
                                      builder: (FormFieldState<bool> field) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: "Dusun",
                                            errorText: field.errorText,
                                            // helperText: "Your gender",
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: false,
                                              child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  value: dusun_id == null
                                                      ? null
                                                      : dusun_id,
                                                  icon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
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
                                                    fontFamily:
                                                        Theme.of(context)
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
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dusun_id = newValue!;
                                                      // kecamatan.fetchKabupaten(
                                                      //     kabupaten_id:
                                                      //         int.parse(newValue));
                                                      bioPetugas.dusun_id =
                                                          int.parse(newValue)!;
                                                    });
                                                  },
                                                  items: [
                                                    for (var data in dusun
                                                        .listDusun.value)
                                                      DropdownMenuItem(
                                                        child: new Text(
                                                          data.namaDusun!,
                                                        ),
                                                        value:
                                                            data.id.toString(),
                                                      )
                                                  ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
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
                                bioPetugas.UpdatePetugas();
                              },
                              child: const Text("Save"),
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
