import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widget/widgets.dart';

class HomePagePetugas extends StatefulWidget {
  const HomePagePetugas({super.key});

  @override
  State<HomePagePetugas> createState() => _HomePagePetugasState();
}

class _HomePagePetugasState extends State<HomePagePetugas> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> slider = [
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text1'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text2'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text3'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text4'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text5'),
    )
  ];

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
                Card(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    title: const Text("John doe"),
                    subtitle: const Text("john.doe@gmail.com"),
                  ),
                ),
                CarouselSlider(
                  items: slider,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: slider.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.purple,
                        child: Column(
                          children: const [],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
