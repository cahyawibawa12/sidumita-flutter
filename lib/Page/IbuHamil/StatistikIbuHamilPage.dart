import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Page/Balita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Page/Balita/Statistik/LingkarKepalaPage.dart';
import 'package:posyandu/Page/Balita/Statistik/TinggiBadanPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class StatistikIbuHamilPage extends StatefulWidget {
  const StatistikIbuHamilPage({super.key});

  @override
  State<StatistikIbuHamilPage> createState() => _StatistikIbuHamilPageState();
}

class _StatistikIbuHamilPageState extends State<StatistikIbuHamilPage> {
  List<Widget> _buildPage() {
    return [
      const BeratBadanPage(),
      const LingkarKepalaPage(),
      const TinggiBadanPage(),
    ];
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(),
          ),
        )
      ],
    );
  }
}
