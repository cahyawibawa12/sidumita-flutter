import 'package:flutter/material.dart';

class WidgetBeratBadan extends StatelessWidget {
  String Umur;
  double dataBerat;
  String pemeriksaan;

  WidgetBeratBadan({
    required this.Umur,
    required this.dataBerat,
    required this.pemeriksaan,
  });

  @override
  Widget build(BuildContext context) {
    if (pemeriksaan != 0) {
      if (Umur == 0) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 1) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 2) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 3) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 4) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 5) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else if (Umur == 6) {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      } else {
        if (dataBerat > 4) {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.red),
            child: Center(child: Text('Tidak Normal')),
          );
        } else {
          return Container(
            // width: 60,
            // height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
            child: Center(child: Text('Normal')),
          );
        }
      }
    } else {
      return Text('Loading');
    }
  }
}
