import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/widgets.dart';

class FormAnggotaKeluarga extends StatefulWidget {
  const FormAnggotaKeluarga({super.key});

  @override
  State<FormAnggotaKeluarga> createState() => _FormAnggotaKeluargaState();
}

class _FormAnggotaKeluargaState extends State<FormAnggotaKeluarga> {
  DateTime _datePicked = DateTime.now();

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
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: 'John Doe',
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
                              onChanged: (value) {},
                            ),
                            TextFormField(
                              initialValue: '5102091234200001',
                              maxLength: 16,
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
                              onChanged: (value) {},
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
                                          value: "Perempuan",
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
                                          onChanged: (String? newValue) {},
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
                            TextFormField(
                              initialValue: 'Denpasar',
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
                              onChanged: (value) {},
                            ),
                            InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                ).then((pickedDate) {
                                  setState(() {
                                    _datePicked = pickedDate!;
                                  });
                                });
                                print("pickedDate: $_datePicked");
                              },
                              child: TextFormField(
                                initialValue: _datePicked.toString(),
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
                                onChanged: (value) {},
                              ),
                            ),
                            TextFormField(
                              initialValue: 'Hindu',
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
                              onChanged: (value) {},
                            ),
                            TextFormField(
                              initialValue: '081',
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
                              onChanged: (value) {},
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
                                          value: "O",
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
                                          onChanged: (String? newValue) {},
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
                            TextFormField(
                              initialValue: 'Siswa',
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
                              onChanged: (value) {},
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
                                          value: "Menikah",
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
                                          onChanged: (String? newValue) {},
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
                                          value: "Anak",
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
                                          onChanged: (String? newValue) {},
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
                            TextFormField(
                              initialValue: 'Indonesia',
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
                              onChanged: (value) {},
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () {},
                              child: const Text("Save"),
                            ),
                          ],
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
