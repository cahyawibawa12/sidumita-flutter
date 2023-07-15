import 'package:flutter/material.dart';
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
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.all(16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/Logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: Image.asset('assets/images/Logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Kids and teens",
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: Image.asset('assets/images/Logo.png'),
            decoration: pageDecoration,
            footer: Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) {
                    return LandingPage();
                  }));
                },
                child: Text("Get Started"),
              ),
            )),
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
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}
