import 'package:flutter/material.dart';

import '../../widget/widgets.dart';

class BukuBalitaBage extends StatefulWidget {
  const BukuBalitaBage({super.key});

  @override
  State<BukuBalitaBage> createState() => _BukuBalitaBageState();
}

class _BukuBalitaBageState extends State<BukuBalitaBage> {
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
