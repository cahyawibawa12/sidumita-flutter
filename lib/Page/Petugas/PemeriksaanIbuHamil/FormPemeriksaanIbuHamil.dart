import 'package:flutter/material.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class FormPemeriksaanIbuHamil extends StatefulWidget {
  const FormPemeriksaanIbuHamil({super.key});

  @override
  State<FormPemeriksaanIbuHamil> createState() =>
      _FormPemeriksaanIbuHamilState();
}

class _FormPemeriksaanIbuHamilState extends State<FormPemeriksaanIbuHamil> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Create Pemeriksaan Ibu Hamil"),
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
                      labelText: 'Umur Kandungan',
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
                      labelText: 'Lingkar Perut',
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
                      labelText: 'Denyut Nadi',
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
                      labelText: 'Denyut Jantung Bayi',
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
