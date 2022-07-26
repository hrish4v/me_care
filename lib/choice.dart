import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:me_care/loginDoctor.dart';
import 'package:me_care/loginPatient.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Select your type",
                    textStyle: TextStyle(
                        color: Color(0xFF1d6614),
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                    curve: Curves.easeIn,
                    speed: Duration(microseconds: 100000),
                    cursor: "..",
                  ),
                ],
                repeatForever: true,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPatient())),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 47, 100, 49).withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF1d6614)),
                ),
                child: Image.asset(
                  "assets/doctor.png",
                  color: Color(0xFF1d6614),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPatient())),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 47, 100, 49).withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF1d6614)),
                ),
                child: Image.asset(
                  "assets/patient.png",
                  color: Color(0xFF1d6614),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
