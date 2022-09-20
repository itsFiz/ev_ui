import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';

class Bbq extends StatefulWidget {
  const Bbq({Key? key}) : super(key: key);

  @override
  State<Bbq> createState() => _BbqState();
}

class _BbqState extends State<Bbq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('BBQ'),
      ),
    );
  }
}
