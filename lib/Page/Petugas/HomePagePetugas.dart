import 'package:flutter/material.dart';

import '../../widget/widgets.dart';

class HomePagePetugas extends StatefulWidget {
  const HomePagePetugas({super.key});

  @override
  State<HomePagePetugas> createState() => _HomePagePetugasState();
}

class _HomePagePetugasState extends State<HomePagePetugas> {
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
