import 'package:flutter/material.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/Form.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/User.dart';
import 'package:posyandu/widget/widgets.dart';

class EditPeserta extends StatefulWidget {
  const EditPeserta({super.key});

  @override
  State<EditPeserta> createState() => _EditPesertaState();
}

class _EditPesertaState extends State<EditPeserta> {
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(child: Container()))
    ]);
  }
}
