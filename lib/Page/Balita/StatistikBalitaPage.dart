import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Page/Balita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Page/Balita/Statistik/LingkarKepalaPage.dart';
import 'package:posyandu/Page/Balita/Statistik/TinggiBadanPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class StatistikBalitaPage extends StatefulWidget {
  const StatistikBalitaPage({super.key});

  @override
  State<StatistikBalitaPage> createState() => _StatistikBalitaPageState();
}

class _StatistikBalitaPageState extends State<StatistikBalitaPage> {
  // List<Widget> _buildPage() {
  //   return [
  //     const BeratBadanPage(),
  //     const LingkarKepalaPage(),
  //     const TinggiBadanPage(),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(25.0)),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Berat Badan',
                        ),
                        Tab(
                          text: 'Lingkar Kepala',
                        ),
                        Tab(
                          text: 'Tinggi Badan',
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                      child: TabBarView(children: <Widget>[
                    BeratBadanPage(),
                    LingkarKepalaPage(),
                    TinggiBadanPage()
                  ]))
                ],
              ),
            )),
      )
    ]);
  }
}
