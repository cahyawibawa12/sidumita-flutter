import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/KontenController.dart';
import 'package:posyandu/Page/Konten/DetailBerita.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/LoginPage.dart';

import 'package:posyandu/widget/widgets.dart';

class HalamanBerita extends StatefulWidget {
  const HalamanBerita({super.key});

  @override
  State<HalamanBerita> createState() => _HalamanBeritaState();
}

class _HalamanBeritaState extends State<HalamanBerita> {
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

  // final List<Widget> slider = [
  //   Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text('text1'),
  //   ),
  //   Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text('text2'),
  //   ),
  //   Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text('text3'),
  //   ),
  //   Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text('text4'),
  //   ),
  //   Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text('text5'),
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Obx(() => kontenController.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage('assets/images/bg.png'),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "SIDUMITA",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                        "Sistem Informasi Ibu Hamil dan Balita"),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                    children:
                                        images.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => carouselController
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
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
                          ],
                        ),
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
                                itemCount: kontenController.listKonten.length,
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Card(
                                      color: Colors.green[200],
                                      child: ListTile(
                                        leading: Image.network(
                                            "http://127.0.0.1:8000/storage/" +
                                                kontenController.listKonten
                                                    .value[index].gambar!),
                                        title: Text(
                                          kontenController
                                              .listKonten.value[index].judul!,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        subtitle: Text(
                                            kontenController.listKonten
                                                .value[index].konten!,
                                            maxLines: 2),
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
