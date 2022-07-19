import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:me_care/cards.dart';
import 'package:me_care/circularContainer.dart';
import 'package:me_care/doctors.dart';
import 'package:me_care/firestoresSer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController = TextEditingController();
  late FixedExtentScrollController controller;
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag5 = false;
  String spec = "brain";

  @override
  void initState() {
    // TODO: implement initState
    _textEditingController.clear();
    controller = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.clear();
    _textEditingController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              width: double.infinity,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Color(0xFF207016).withOpacity(0.0),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "MeCare+",
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 40),
                          curve: Curves.easeIn,
                          speed: Duration(microseconds: 100000),
                          cursor: "_",
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart_circle_fill,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          controller: _textEditingController,
                          style: TextStyle(color: Color(0xFF207016)),
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: "Enter the city",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: const BorderSide(
                                  color: Color(0xFF207016), width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: const BorderSide(
                                  color: Color(0xFF207016), width: 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      flag1 = true;
                                      flag2 = false;
                                      flag3 = false;
                                      flag4 = false;
                                      flag5 = false;
                                      spec = "heart";
                                      setState(() {});
                                    },
                                    child: ImgCard(
                                      img: 'assets/heart.png',
                                      flag: flag1,
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      flag1 = false;
                                      flag2 = true;
                                      flag3 = false;
                                      flag4 = false;
                                      flag5 = false;
                                      spec = "brain";
                                      setState(() {});
                                    },
                                    child: ImgCard(
                                      img: 'assets/brain.png',
                                      flag: flag2,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    flag1 = false;
                                    flag2 = false;
                                    flag3 = true;
                                    flag4 = false;
                                    flag5 = false;
                                    spec = "bone";
                                    setState(() {});
                                  },
                                  child: ImgCard(
                                    img: 'assets/bone.png',
                                    flag: flag3,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    flag1 = false;
                                    flag2 = false;
                                    flag3 = false;
                                    flag4 = true;
                                    flag5 = false;
                                    spec = "dentist";
                                    setState(() {});
                                  },
                                  child: ImgCard(
                                    img: 'assets/dentist.png',
                                    flag: flag4,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    flag1 = false;
                                    flag2 = false;
                                    flag3 = false;
                                    flag4 = false;
                                    flag5 = true;
                                    spec = "neuro";
                                    setState(() {});
                                  },
                                  child: ImgCard(
                                    img: 'assets/neuro.png',
                                    flag: flag5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Doctors(
                                city: _textEditingController.text,
                                spec: spec,
                              ),
                            ),
                          );
                          _textEditingController.clear();
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 47, 100, 49)
                                    .withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Color(0xFF0207016),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Go ->',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
