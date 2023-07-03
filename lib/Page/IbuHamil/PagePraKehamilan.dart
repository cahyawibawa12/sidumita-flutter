import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/IbuHamil.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class PagePraKehamilan extends StatefulWidget {
  PagePraKehamilan({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<PagePraKehamilan> createState() => _PagePraKehamilanState();
}

class _PagePraKehamilanState extends State<PagePraKehamilan> {
  var ibuHamil = Get.put(IbuHamilController());

  @override
  void initState() {
    super.initState();
    ibuHamil.tinggi_pra.text =
        widget.ibuHamilModel.tinggiBadanPrakehamilan.toString();
    ibuHamil.berat_pra.text =
        widget.ibuHamilModel.beratBadanPrakehamilan.toString();
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
                child: Obx(
              () => ibuHamil.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 160.0,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                              image: AssetImage('assets/images/pra-ibu3.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        controller: ibuHamil.berat_pra,
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
                                        controller: ibuHamil.tinggi_pra,
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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    ibuHamil.UpdateIbuHamil(
                                        widget.ibuHamilModel.id!);
                                  },
                                  child: const Text("Save"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            )),
          ),
        )
      ],
    );
  }
}
