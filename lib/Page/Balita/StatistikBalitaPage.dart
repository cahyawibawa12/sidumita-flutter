import 'package:flutter/material.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class StatistikBalitaPage extends StatefulWidget {
  const StatistikBalitaPage({super.key});

  @override
  State<StatistikBalitaPage> createState() => _StatistikBalitaPageState();
}

class _StatistikBalitaPageState extends State<StatistikBalitaPage> {
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
