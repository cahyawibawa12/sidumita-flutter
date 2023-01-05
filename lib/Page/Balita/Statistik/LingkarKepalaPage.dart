import 'package:flutter/material.dart';

import '../../../widget/widgets.dart';

class LingkarKepalaPage extends StatefulWidget {
  const LingkarKepalaPage({super.key});

  @override
  State<LingkarKepalaPage> createState() => _LingkarKepalaPageState();
}

class _LingkarKepalaPageState extends State<LingkarKepalaPage> {
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
                child: Text("ini lingkar"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
