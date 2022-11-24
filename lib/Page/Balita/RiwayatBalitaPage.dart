import 'package:flutter/material.dart';
import 'package:posyandu/widget/widgets.dart';

class RiwayatBalitaPage extends StatefulWidget {
  const RiwayatBalitaPage({super.key});

  @override
  State<RiwayatBalitaPage> createState() => _RiwayatBalitaPageState();
}

class _RiwayatBalitaPageState extends State<RiwayatBalitaPage> {
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
