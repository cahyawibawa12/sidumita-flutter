import 'package:flutter/material.dart';
import 'package:posyandu/widget/widgets.dart';

class ProfilBalitaPage extends StatefulWidget {
  const ProfilBalitaPage({super.key});

  @override
  State<ProfilBalitaPage> createState() => _ProfilBalitaPageState();
}

class _ProfilBalitaPageState extends State<ProfilBalitaPage> {
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
