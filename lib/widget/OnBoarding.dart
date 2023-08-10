import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Page/LandingPage.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 18.0),
      bodyPadding: EdgeInsets.all(16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "SIDUMITA",
          body:
              "Selamat Datang pada Sistem Informasi Posyandu Ibu Hamil dan Balita",
          image: Image.asset('assets/images/Logo.png', scale: 2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Login User",
          body:
              "Kalian dapat melakukan login dengan menekan icon pada bagian pojok kanan atas seperti pada gambar",
          image: Image.asset('assets/images/login1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Role User",
          body:
              "Pada Aplikasi Mobile Sidumita terdapat 2 buah user, kalian dapat memilih masuk sebagai salah satunya",
          image: Image.asset('assets/images/pilihan.png', scale: 1.5),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pemeriksaan Balita dan Ibu Hamil",
          body: "User melihat riwayat pemeriksaan balita maupun ibu hamil",
          image: Image.asset('assets/images/list.png', scale: 1.8),
          decoration: pageDecoration,
        ),

        // PageViewModel(
        //   title: "Jadwal Posyandu",
        //   body:
        //       "User dapat melihat jadwal dari posyandu sekitar daerah tempat tinggal",
        //   image: Image.asset('assets/images/jadwal_1.png', scale: 1.8),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: "Statistik Pertumbuhan",
          body:
              "User dapat melihat statistik pertumbuhan baik balita maupun ibu hamil",
          image: Image.asset('assets/images/chart.png', scale: 2),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   title: "",
        //   body: "",
        //   image: Image.asset(
        //     'assets/images/pilihan.png',
        //     scale: 1.5,
        //   ),
        //   decoration: pageDecoration,
        //   // footer: Padding(
        //   //   padding: const EdgeInsets.all(50),
        //   //   child: ElevatedButton(
        //   //     onPressed: () {
        //   //       Navigator.pushReplacement(context,
        //   //           MaterialPageRoute(builder: (builder) {
        //   //         return LandingPage();
        //   //       }));
        //   //     },
        //   //     child: Text("Mulai"),
        //   //   ),
        //   // )
        // ),
      ],
      onDone: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) {
          return LandingPage();
        }));
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      back: Icon(Icons.arrow_back),
      skip: Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
          size: Size(10, 10),
          color: Colors.grey,
          activeSize: Size(15, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}
