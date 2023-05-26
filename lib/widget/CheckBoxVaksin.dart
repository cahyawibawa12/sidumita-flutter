import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/VaksinController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';

class CheckBoxVaksin extends StatefulWidget {
  const CheckBoxVaksin({super.key});

  @override
  State<CheckBoxVaksin> createState() => _CheckBoxVaksinState();
}

class _CheckBoxVaksinState extends State<CheckBoxVaksin> {
  var listVaksin = Get.put(VaksinController());
  var pemeriksaanBalitaByPetugasController =
      Get.put(PemeriksaanBalitaController());
  final _formKey = GlobalKey<FormState>();

  List<Map> vaksinBalita = [];
  @override
  void initState() {
    super.initState();
    listVaksin.getVaksin();
  }

  bool isChecked = false;
  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
      });
      pemeriksaanBalitaByPetugasController.isVaksinCheck.value = true;
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
      });
      pemeriksaanBalitaByPetugasController.isVaksinCheck.value = false;
      // pemeriksaanBalitaByPetugasController
      //     .pemeriksaanBalitaByPetugas.value.vaksinId!
      //     .clear();
    }
  }

  var resultHolder = 'Checkbox is UN-CHECKED';
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                toggleCheckbox(value!);
              },
              activeColor: Colors.pink,
              checkColor: Colors.white,
              tristate: false,
            ),
          ),
          Text(
            'Apakah Balita Vaksin?',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      if (isChecked)
        // The checkboxes will be here
        Obx(() => listVaksin.isLoading.value
            ? CircularProgressIndicator()
            : LayoutBuilder(builder: (context, constraint) {
                return FormField(
                  key: _formKey,
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        errorText: field.errorText,
                        border: InputBorder.none,
                      ),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listVaksin.data.length,
                          itemBuilder: (context, index) {
                            return Obx(() => CheckboxListTile(
                                  title: Text(
                                      listVaksin.data[index]["nama_vaksin"]),
                                  value: listVaksin.data[index]["checked"] ??
                                      false,
                                  onChanged: (value) {
                                    listVaksin.data.value[index]['checked'] =
                                        value;
                                    listVaksin.data.refresh();
                                    listVaksin.update();
                                  },
                                ));
                          },
                        ),
                      ),
                    );
                  },
                );
              })),
    ]);
  }
}
