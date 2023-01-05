import 'package:flutter/material.dart';

import '../../../widget/widgets.dart';

class BeratBadanPage extends StatefulWidget {
  const BeratBadanPage({super.key});

  @override
  State<BeratBadanPage> createState() => _BeratBadanPageState();
}

class _BeratBadanPageState extends State<BeratBadanPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              child: Center(
                child: Text("ini berat"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
