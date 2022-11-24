import 'package:flutter/material.dart';
import 'package:posyandu/widget/widgets.dart';

class JadwalBalitaPage extends StatefulWidget {
  const JadwalBalitaPage({super.key});

  @override
  State<JadwalBalitaPage> createState() => _JadwalBalitaPageState();
}

class _JadwalBalitaPageState extends State<JadwalBalitaPage> {
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
