import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImgCard extends StatelessWidget {
  final String img;
  bool flag = false;
  ImgCard({required this.img, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 47, 100, 49).withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        shape: BoxShape.circle,
        color: (flag == true) ? Color(0xFF207016) : Colors.white,
        // borderRadius: BorderRadius.all(
        //   Radius.circular(10),
        // ),
      ),
      child: Image.asset(
        img,
        color: (flag == false) ? Color(0xFF207016) : Colors.white,
      ),
    );
  }
}
