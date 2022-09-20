import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff05223B),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/ev.png',
            //   width: 120,
            //   height: 100,
            // ),

            SizedBox(
              height: 100,
            ),
            Text(
              'EV',
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'A Home Away From Home',
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              'Account Registered!',
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff00314D),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff05B1A1), width: 1.2),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff00314D),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffC51A1A), width: 1.2),
              ),
              child: TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('EXIT'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
