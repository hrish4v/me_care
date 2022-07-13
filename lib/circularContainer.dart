import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircularAva extends StatelessWidget {
  final String img;
  const CircularAva({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      //width: double.infinity,
      child: Image.asset(
        img,
        height: 20,
        width: 20,
        color: Color(0xFF1d6614),
      ),
    );
  }
}
