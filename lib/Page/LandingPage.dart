import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/KontenController.dart';
import 'package:posyandu/Page/Konten/DetailBerita.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/LoginPage.dart';

import 'package:posyandu/widget/widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  var kontenController = Get.put(KontenController());

  Future<void> _refresh(bool reload) async {
    await Get.find<KontenController>().ShowKonten();
  }

  void initState() {
    super.initState();
    kontenController.ShowKonten();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Obx(() => kontenController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    AssetImage('assets/images/Logo.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "Sistem Informasi Posyandu Ibu Hamil dan Balita",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingLogin()),
                                );
                              }),
                              icon:
                                  const Icon(CupertinoIcons.person_crop_circle),
                              iconSize: 35,
                              color: Color.fromARGB(255, 24, 98, 26),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Builder(builder: (context) {
                          List images = [
                            "https://akah.desa.id/desa/upload/artikel/sedang_1583992455_PSOYANDU.jpg",
                            "https://dinkes.blorakab.go.id/packages/upload/photo/2022-08-08/WhatsApp-Image-2022-08-01-at-12.42.14.jpeg",
                            "https://dinkes.blorakab.go.id/packages/upload/portal/images/WhatsApp%20Image%202022-08-01%20at%2012.42.13.jpeg",
                            "https://purwosari.magetan.go.id/media/img/berita/berita_3185e42771946ee32.18845142.jpg",
                            "https://i1.wp.com/dinkes.rembangkab.go.id/binangkit/uploads/2023/02/Cover-Berita.jpg?resize=675%2C482&ssl=1",
                          ];

                          return Column(
                            children: [
                              CarouselSlider(
                                carouselController: carouselController,
                                options: CarouselOptions(
                                  height: 200.0,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    currentIndex = index;
                                    setState(() {});
                                  },
                                ),
                                items: kontenController.listKonten.value
                                    .map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://sidumita.definitelynotgod.com/storage/" +
                                                  imageUrl.gambar!,
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
                                children: kontenController.listKonten.value
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      currentIndex == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Informasi Menarik',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await _refresh(true);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListView.builder(
                                // scrollDirection: Axis.vertical,

                                shrinkWrap: true,
                                itemCount: kontenController.listKonten.length,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailBerita(
                                                      kontenModel:
                                                          kontenController
                                                                  .listKonten[
                                                              index],
                                                    )));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.transparent,
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.green[200],
                                          ),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                    child: Image.network(
                                                  "https://sidumita.definitelynotgod.com/storage/" +
                                                      kontenController
                                                          .listKonten
                                                          .value[index]
                                                          .gambar!,
                                                )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                child: Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        kontenController
                                                            .listKonten
                                                            .value[index]
                                                            .judul!,
                                                        // maxLines: 4,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // child: ListTile(
                                        //   leading: Image.network(
                                        //     "https://sidumita.definitelynotgod.com/storage/" +
                                        //         kontenController.listKonten
                                        //             .value[index].gambar!,
                                        //   ),
                                        //   title: Text(
                                        //     kontenController
                                        //         .listKonten.value[index].judul!,
                                        //     maxLines: 2,
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.w700),
                                        //   ),
                                        //   subtitle: Text(
                                        //       kontenController.listKonten
                                        //           .value[index].konten!,
                                        //       maxLines: 2),
                                        //   onTap: () {
                                        //     Navigator.of(context).push(
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 DetailBerita(
                                        //                   kontenModel:
                                        //                       kontenController
                                        //                               .listKonten[
                                        //                           index],
                                        //                 )));
                                        //   },
                                        // ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
            ))
      ],
    );
  }
}
