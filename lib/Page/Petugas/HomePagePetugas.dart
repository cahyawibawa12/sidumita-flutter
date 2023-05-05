import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:posyandu/Page/Petugas/JadwalPosyandu.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/PemeriksaanBalitaPage.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/PemeriksaanIbuHamilPage.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/ProfilPetugas.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/widgets.dart';

class HomePagePetugas extends StatefulWidget {
  const HomePagePetugas({super.key});

  @override
  State<HomePagePetugas> createState() => _HomePagePetugasState();
}

class _HomePagePetugasState extends State<HomePagePetugas> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if (user != null) {
      setState(() {
        name = user['name'];
        email = user['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromARGB(255, 185, 246, 188),
                    child: ListTile(
                      title: Text(
                        '${name}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${email}'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /*
                TODO: Implement this @ controller
                int currentIndex = 0;
                final CarouselController carouselController = CarouselController();
                */
                Builder(builder: (context) {
                  List images = [
                    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                    "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                  ];

                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 160.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                        ),
                        items: images.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(currentIndex == entry.key
                                          ? 0.9
                                          : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }),

                SizedBox(
                  height: 500,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 185, 246, 188)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilPetugas()));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/petugas.png'),
                                          radius: 70,
                                        ),
                                      ),
                                      Text(
                                        "Profil Petugas",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 185, 246, 188)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JadwalPosyandu()));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/jadwal.png'),
                                          radius: 70,
                                        ),
                                      ),
                                      Text(
                                        "Jadwal Posyandu",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 185, 246, 188)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PemeriksaanBalitaPage()));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/baby1.png'),
                                          radius: 70,
                                        ),
                                      ),
                                      Text(
                                        "Pemeriksaan Balita",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 185, 246, 188)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PemeriksaanIbuHamilPage()));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/ibu.png'),
                                          radius: 70,
                                        ),
                                      ),
                                      Text(
                                        "Pemeriksaan Ibu Hamil",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10)),
                    ),
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: GridView.builder(
                //     padding: EdgeInsets.zero,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //       childAspectRatio: 1.0,
                //       crossAxisCount: 2,
                //       mainAxisSpacing: 10.0,
                //       crossAxisSpacing: 10.0,
                //     ),
                //     itemCount: 4,
                //     shrinkWrap: true,
                //     physics: const ScrollPhysics(),
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         child: Material(
                //           child: InkWell(
                //             onTap: () {},
                //             child: MyMenu("assets/images/bg.png",
                //                 "Profil Petugas", 0xff008000),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
