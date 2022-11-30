import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;

  const RoundedButton(
      {Key? key, required this.btnText, required this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        color: Color.fromARGB(255, 64, 207, 69),
        borderRadius: BorderRadius.circular(30),
        child: Center(
          child: Container(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    onBtnPressed();
                  },
                  minWidth: 150,
                  height: 50,
                  child: Text(
                    btnText,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
