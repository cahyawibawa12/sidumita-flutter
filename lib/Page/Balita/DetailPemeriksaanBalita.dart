import 'package:flutter/material.dart';

import '../../widget/widgets.dart';

class DetailPemeriksaanBalita extends StatefulWidget {
  const DetailPemeriksaanBalita({super.key});

  @override
  State<DetailPemeriksaanBalita> createState() =>
      _DetailPemeriksaanBalitaState();
}

class _DetailPemeriksaanBalitaState extends State<DetailPemeriksaanBalita> {
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
