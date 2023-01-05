import 'package:flutter/material.dart';

import '../../../widget/widgets.dart';

class TinggiBadanPage extends StatefulWidget {
  const TinggiBadanPage({super.key});

  @override
  State<TinggiBadanPage> createState() => _TinggiBadanPageState();
}

class _TinggiBadanPageState extends State<TinggiBadanPage> {
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
                child: Text("ini tinggi"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
