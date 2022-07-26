import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF1d6614)),
              ),
              child: Image.asset(
                "asset/doctor.png",
                color: Color(0xFF1d6614),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("asset/patient.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all(color: Color(0xFF1d6614)),
              ),
              child: Image.asset(
                "asset/doctor.png",
                color: Color(0xFF1d6614),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
