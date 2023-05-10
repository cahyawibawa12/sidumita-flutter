import 'package:flutter/material.dart';

import '../../widget/BackgroundImage.dart';

class ImunisasiBalitaPage extends StatefulWidget {
  const ImunisasiBalitaPage({super.key});

  @override
  State<ImunisasiBalitaPage> createState() => _ImunisasiBalitaPageState();
}

class _ImunisasiBalitaPageState extends State<ImunisasiBalitaPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 4.0,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: const Text("Jessica Doe"),
                        // subtitle: const Text("Programmer"),
                        trailing: const Text("test"),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
