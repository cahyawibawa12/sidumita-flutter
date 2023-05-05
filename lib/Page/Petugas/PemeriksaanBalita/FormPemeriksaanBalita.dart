import 'package:flutter/material.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:posyandu/widget/CheckBoxVaksin.dart';

class FormPemeriksaanBalita extends StatefulWidget {
  const FormPemeriksaanBalita({super.key});

  @override
  State<FormPemeriksaanBalita> createState() => _FormPemeriksaanBalitaState();
}

class _FormPemeriksaanBalitaState extends State<FormPemeriksaanBalita> {
  bool _checkBoxVal = true;
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
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'John Doe',
                    maxLength: 20,
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
                    onChanged: (value) {},
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      print("pickedDate: $pickedDate");
                    },
                    child: TextFormField(
                      initialValue: '2022-08-01',
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
                      onChanged: (value) {},
                    ),
                  ),
                  TextFormField(
                    initialValue: '24',
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
                  TextFormField(
                    initialValue: '24',
                    keyboardType: TextInputType.number,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: '24',
                    keyboardType: TextInputType.number,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: '24',
                    keyboardType: TextInputType.number,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: '24',
                    keyboardType: TextInputType.number,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: 'Tidak Ada Keluhan',
                    maxLength: 200,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: 'Tidak Ada Penanganan',
                    maxLength: 200,
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
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    initialValue: 'Tidak Ada Catatan Khusus',
                    maxLength: 200,
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
                    onChanged: (value) {},
                  ),

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
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          )),
        )
      ],
    );
  }
}
