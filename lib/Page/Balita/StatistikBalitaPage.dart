import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class StatistikBalitaPage extends StatefulWidget {
  const StatistikBalitaPage({super.key});

  @override
  State<StatistikBalitaPage> createState() => _StatistikBalitaPageState();
}

class _StatistikBalitaPageState extends State<StatistikBalitaPage> {
  List<String> items = [
    "Berat Badan",
    "Tinggi Badan",
    "Lingkar Kepala",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 80,
                              height: 45,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Colors.white70
                                    : Colors.white54,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: current == index
                                    ? Border.all(
                                        color: Colors.deepOrangeAccent,
                                        width: 2)
                                    : null,
                              ),
                              child: Center(
                                  child: Text(
                                items[index],
                                style: GoogleFonts.laila(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey),
                              )),
                            ),
                          ),
                          Visibility(
                              visible: current == index,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    shape: BoxShape.circle),
                              ))
                        ],
                      );
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[current],
                          size: 200,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          items[current],
                          style: GoogleFonts.laila(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ))
              ],
            ),
          )),
        )
      ],
    );
  }
}
