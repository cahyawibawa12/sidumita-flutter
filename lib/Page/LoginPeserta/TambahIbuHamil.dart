import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/IbuHamil.dart';
import 'package:intl/intl.dart';

import '../../widget/BackgroundImage.dart';

class TambahIbuHamil extends StatefulWidget {
  const TambahIbuHamil({super.key});

  @override
  State<TambahIbuHamil> createState() => _TambahIbuHamilState();
}

class _TambahIbuHamilState extends State<TambahIbuHamil> {
  var ibuHamilFromKeluarga = Get.put(DetailKeluargaController());
  var ibuHamilController = Get.put(IbuHamilController());

  void initState() {
    super.initState();
    ibuHamilFromKeluarga.showIbuHamilFromKeluarga();
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
                          child: Text("Tambah Ibu Hamil",
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
                            // key: _form,
                            child: Column(
                              children: [
                                Obx(() => ibuHamilFromKeluarga.isLoading.value
                                    ? CircularProgressIndicator()
                                    : LayoutBuilder(
                                        builder: (context, constraint) {
                                        // List<String> itemStringList = ["Female", "Male"];

                                        return FormField(
                                          initialValue: false,
                                          enabled: true,
                                          builder:
                                              (FormFieldState<bool> field) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                labelText:
                                                    "Pilih Ibu dari Detail Keluarga",
                                                errorText: field.errorText,
                                                // helperText: "Your gender",
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                  alignedDropdown: false,
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      value: ibuHamilController
                                                                  .detail_keluarga_id ==
                                                              null
                                                          ? null
                                                          : ibuHamilController
                                                              .detail_keluarga_id
                                                              .toString(),
                                                      icon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10.0),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_drop_down_outlined,
                                                          size: 24.0,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .color,
                                                        ),
                                                      ),
                                                      iconSize: 16,
                                                      elevation: 16,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Theme.of(context)
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
                                                          ibuHamilController
                                                                  .detail_keluarga_id =
                                                              int.parse(
                                                                  newValue!);
                                                        });
                                                      },
                                                      hint: Text("Pilih Ibu"),
                                                      items: [
                                                        for (var data
                                                            in ibuHamilFromKeluarga
                                                                .listIbuFromKeluarga
                                                                .value)
                                                          DropdownMenuItem(
                                                            child: new Text(
                                                              data.namaLengkap!,
                                                            ),
                                                            value: data.id
                                                                .toString(),
                                                          )
                                                      ]),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      })),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        controller:
                                            ibuHamilController.berat_pra,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Berat Pra-Kehamilan',
                                          hintText: '59',
                                          labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                          ),

                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          // helperText: 'Enter your email address',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "Kg",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        controller:
                                            ibuHamilController.tinggi_pra,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Tinggi Pra-Kehamilan',
                                          hintText: '159',
                                          labelStyle: TextStyle(
                                            color: Colors.blueGrey,
                                          ),

                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          // helperText: 'Enter your email address',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 42,
                                    ),
                                    Text(
                                      "Cm",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 2,
                                  validator: (nameValue) {
                                    // if (nameValue!.isEmpty) {
                                    //   return 'Mohon masukan data';
                                    // }
                                    // detailKeluarga.no_telp.text = nameValue;
                                    // return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Kehamilan Ke',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  controller: ibuHamilController.kehamilan_ke,
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
                                      tanggal = ibuHamilController
                                          .tanggal_kehamilan.text;
                                      ibuHamilController
                                              .tanggal_kehamilan.text =
                                          DateFormat('y-M-d')
                                              .format(pickedDate!);
                                    });
                                    tanggal =
                                        DateFormat('y-M-d').format(pickedDate!);
                                    print("pickedDate: $tanggal");
                                  },
                                  child: TextFormField(
                                    controller:
                                        ibuHamilController.tanggal_kehamilan,
                                    readOnly: true,
                                    // validator: (nameValue) {
                                    //   if (nameValue!.isEmpty) {
                                    //     return 'Mohon masukan data';
                                    //   }
                                    //   detailKeluarga.tanggal_lahir.text =
                                    //       nameValue;
                                    //   return null;
                                    // },
                                    maxLength: 20,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Tanggal Pra Kehamilan',
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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    // if (_form.currentState!.validate()) {
                                    ibuHamilController.StoreIbuHamil();
                                    // }
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
            ))
      ],
    );
  }
}
