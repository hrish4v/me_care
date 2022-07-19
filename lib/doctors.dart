import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:me_care/firestoresSer.dart';
import 'package:me_care/makeAppointment.dart';

class Doctors extends StatefulWidget {
  late String city;
  late String spec;

  Doctors({required this.city, required this.spec});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color(0xFF1d6614),
      appBar: AppBar(
        backgroundColor: Color(0xFF1d6614),
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Available Doctors",
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              curve: Curves.easeIn,
              speed: Duration(microseconds: 100000),
              cursor: "..",
            ),
          ],
          repeatForever: true,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("city")
              .doc(widget.city)
              .collection(widget.spec)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF1d6614),
                ),
              );
            }
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (context, item) {
                  if (snapshot.data!.docs.length == 0) {
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              "No doctor found :(",
                              textStyle: TextStyle(
                                color: Color(0xFF1d6614),
                                fontSize: 25,
                              ),
                              speed: Duration(microseconds: 100000),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MakeAppointment(
                            imgURL: snapshot.data!.docs[item].get("photo"),
                            name: snapshot.data!.docs[item].get("name"),
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 47, 100, 49)
                                  .withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 47, 100, 49)
                                        .withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data!.docs[item].get("photo"),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: Color(0xFF1d6614),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              snapshot.data!.docs[item].get("name"),
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF1d6614),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }

            if (snapshot.hasError) {
              return Expanded(
                  child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Some internal error occured...Try again after a while",
                    style: TextStyle(
                      color: Color(0xFF1d6614),
                    ),
                  ),
                ),
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF1d6614),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
