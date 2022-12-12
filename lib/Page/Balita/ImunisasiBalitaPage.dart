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
          body: SafeArea(child: Column()),
        )
      ],
    );
  }
}
