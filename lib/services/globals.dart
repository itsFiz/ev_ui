import 'package:flutter/material.dart';

const String baseURL = "http://192.168.0.145:8000/api/"; //emulator localhost
const Map<String, String> headersWithoutToken = {
  "Content-Type": "application/json"
};

Map<String, String> headersWithToken(String token) => {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token,
    };
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
