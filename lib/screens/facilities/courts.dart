import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';

class Courts extends StatefulWidget {
  const Courts({Key? key}) : super(key: key);

  @override
  State<Courts> createState() => _CourtsState();
}

class _CourtsState extends State<Courts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Courts'),
      ),
    );
  }
}
