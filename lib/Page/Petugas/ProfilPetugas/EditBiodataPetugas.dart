import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/DaerahController.dart';
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
  // var provinsi = Get.put(ProvinsiController());
  // var kabupaten = Get.put(KabupatenController());
  // var kecamatan = Get.put(KecamatanController());
  // var desa = Get.put(DesaController());
  // var dusun = Get.put(DusunController());
  var daerahController = Get.put(DaerahController());

  @override
  void initState() {
    super.initState();
    bioPetugas.ShowPetugas().whenComplete(() {
      print("bebas");
      if (bioPetugas.petugas.value.kabupatenId != null) {
        daerahController.fetchProvinsi(
            provinsi_id: bioPetugas.petugas.value.provinsiId);
      }
      if (bioPetugas.petugas.value.kecamatanId != null) {
        daerahController.fetchKabupaten(
            kabupaten_id: bioPetugas.petugas.value.kabupatenId);
      }
      if (bioPetugas.petugas.value.desaId != null) {
        daerahController.fetchKecamatan(
            kecamatan_id: bioPetugas.petugas.value.kecamatanId);
      }
      if (bioPetugas.petugas.value.dusunId != null) {
        daerahController.fetchDesa(desa_id: bioPetugas.petugas.value.desaId);
      }
    });
    daerahController.getProvinsi();
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
                            Obx(() => daerahController.isLoading.value
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
                                              child: DropdownButton<String?>(
                                                  isExpanded: true,
                                                  value: bioPetugas
                                                              .petugas
                                                              .value
                                                              .provinsiId ==
                                                          null
                                                      ? null
                                                      : bioPetugas.petugas.value
                                                          .provinsiId
                                                          .toString(),
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
                                                      bioPetugas.petugas.value
                                                              .provinsiId =
                                                          int.parse(newValue!);
                                                      daerahController
                                                          .fetchProvinsi(
                                                              provinsi_id:
                                                                  int.parse(
                                                                      newValue!));
                                                      bioPetugas.petugas.value
                                                          .kabupatenId = null;
                                                      bioPetugas.petugas.value
                                                          .kecamatanId = null;
                                                      bioPetugas.petugas.value
                                                          .desaId = null;
                                                      bioPetugas.petugas.value
                                                          .dusunId = null;
                                                    });
                                                  },
                                                  hint: Text("Pilih Provinsi"),
                                                  items: [
                                                    for (var data
                                                        in daerahController
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
                            Obx(() => daerahController.isLoading.value
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
                                                  value: bioPetugas
                                                              .petugas
                                                              .value
                                                              .kabupatenId ==
                                                          null
                                                      ? null
                                                      : bioPetugas.petugas.value
                                                          .kabupatenId
                                                          .toString(),
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
                                                      bioPetugas.petugas.value
                                                              .kabupatenId =
                                                          int.parse(newValue!);
                                                      daerahController
                                                          .fetchKabupaten(
                                                              kabupaten_id:
                                                                  int.parse(
                                                                      newValue));
                                                      bioPetugas.petugas.value
                                                          .kecamatanId = null;
                                                      bioPetugas.petugas.value
                                                          .desaId = null;
                                                      bioPetugas.petugas.value
                                                          .dusunId = null;
                                                    });
                                                  },
                                                  hint: Text("Pilih Kabupaten"),
                                                  items: [
                                                    for (var data
                                                        in daerahController
                                                            .listKabupaten
                                                            .value)
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
                            Obx(() => daerahController.isLoading.value
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
                                                  value: bioPetugas
                                                              .petugas
                                                              .value
                                                              .kecamatanId ==
                                                          null
                                                      ? null
                                                      : bioPetugas.petugas.value
                                                          .kecamatanId
                                                          .toString(),
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
                                                      bioPetugas.petugas.value
                                                              .kecamatanId =
                                                          int.parse(newValue!);
                                                      daerahController
                                                          .fetchKecamatan(
                                                              kecamatan_id:
                                                                  int.parse(
                                                                      newValue));
                                                      bioPetugas.petugas.value
                                                          .desaId = null;
                                                      bioPetugas.petugas.value
                                                          .dusunId = null;
                                                    });
                                                  },
                                                  hint: Text("Pilih Kecamatan"),
                                                  items: [
                                                    for (var data
                                                        in daerahController
                                                            .listKecamatan
                                                            .value)
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
                            Obx(() => daerahController.isLoading.value
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
                                                  value: bioPetugas.petugas
                                                              .value.desaId ==
                                                          null
                                                      ? null
                                                      : bioPetugas
                                                          .petugas.value.desaId
                                                          .toString(),
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
                                                      bioPetugas.petugas.value
                                                              .desaId =
                                                          int.parse(newValue!);
                                                      daerahController.fetchDesa(
                                                          desa_id: int.parse(
                                                              newValue));
                                                      bioPetugas.petugas.value
                                                          .dusunId = null;
                                                    });
                                                  },
                                                  items: [
                                                    for (var data
                                                        in daerahController
                                                            .listDesa.value)
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
                            Obx(() => daerahController.isLoading.value
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
                                                  value: bioPetugas.petugas
                                                              .value.dusunId ==
                                                          null
                                                      ? null
                                                      : bioPetugas
                                                          .petugas.value.dusunId
                                                          .toString(),
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
                                                      bioPetugas.petugas.value
                                                              .dusunId =
                                                          int.parse(newValue!);
                                                    });
                                                  },
                                                  items: [
                                                    for (var data
                                                        in daerahController
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
