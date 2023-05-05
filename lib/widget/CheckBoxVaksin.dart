import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CheckBoxVaksin extends StatefulWidget {
  const CheckBoxVaksin({super.key});

  @override
  State<CheckBoxVaksin> createState() => _CheckBoxVaksinState();
}

class _CheckBoxVaksinState extends State<CheckBoxVaksin> {
  bool isChecked = false;
  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
      });
    }
  }

  List<Map> vaksinBalita = [
    {"name": "TBD", "isChecked": false},
    {"name": "BCG", "isChecked": false},
    {
      "name": "T",
      "isChecked": false,
    },
    {"name": "B", "isChecked": false},
    {"name": "C", "isChecked": false}
  ];
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
        Column(
            children: vaksinBalita.map((vaksin) {
          return CheckboxListTile(
              value: vaksin["isChecked"],
              title: Text(vaksin["name"]),
              onChanged: (newValue) {
                setState(() {
                  vaksin["isChecked"] = newValue;
                });
              });
        }).toList()),
      Wrap(
        children: vaksinBalita.map((hobby) {
          if (hobby["isChecked"] == true) {
            return Card(
              elevation: 3,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(hobby["name"]),
              ),
            );
          }

          return Container();
        }).toList(),
      ),
    ]);
  }
}
