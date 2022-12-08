import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/template/custom_appbar.dart';
import 'package:flutter/material.dart';

class Spaces extends StatefulWidget {
  const Spaces({Key? key}) : super(key: key);

  @override
  State<Spaces> createState() => _SpacesState();
}

class _SpacesState extends State<Spaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: templateAppBar(barName: 'Spaces'),
    );
  }
}
