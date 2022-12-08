import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/template/custom_appbar.dart';
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
      appBar: templateAppBar(barName: 'BBQ'),
    );
  }
}
