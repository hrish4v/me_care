import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class MakeAppointment extends StatefulWidget {
  late String imgURL = "";
  late String name = "";
  MakeAppointment({required this.imgURL, required this.name});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  var now = new DateTime.now();
  late String _gender = 'Male';
  var _sex = ['Male', 'Female'];
  String currDate = "----";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  showAlertDialog2(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () => Navigator.of(context).pop(),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Fields can't be empty"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Continue"),
      onPressed: () => Navigator.of(context).popUntil(
        ModalRoute.withName("home"),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Appointment sucessfully made"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void bookAppointment(String doct, String pat, String age, String sex) async {
    await FirebaseFirestore.instance
        .collection("appointments")
        .doc(doct)
        .collection(currDate)
        .add({"name": pat, "age": age, "sex": sex});
  }

  @override
  void initState() {
    var formatter = new DateFormat('yyyy-MM-dd');
    currDate = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1d6614),
      appBar: AppBar(
        backgroundColor: Color(0xFF1d6614),
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Make Appointment",
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
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 47, 100, 49).withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(widget.imgURL),
                        fit: BoxFit.fill,
                      ),
                      border: Border.all(
                        color: Color(0xFF1d6614),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      margin: EdgeInsets.only(left: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF1d6614),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "(MBBS)",
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "PMCH, Gandhi Maidan, Patna",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: "Patient's Name",
                        hintStyle: TextStyle(color: Colors.black54),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: const BorderSide(
                              color: Color(0xFF207016), width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: const BorderSide(
                              color: Color(0xFF207016), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 65,
                    child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: "Age",
                        hintStyle: TextStyle(color: Colors.black54),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: const BorderSide(
                              color: Color(0xFF207016), width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: const BorderSide(
                              color: Color(0xFF207016), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 7),
                      width: 90,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Color.fromARGB(255, 65, 147, 55),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _gender,
                          isDense: true,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                          items: _sex.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ))
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (_ageController.text.isEmpty ||
                    _nameController.text.isEmpty) {
                  showAlertDialog2(context);
                } else {
                  bookAppointment(widget.name, _nameController.text,
                      _ageController.text, _gender);
                  showAlertDialog(context);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 47, 100, 49).withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(3, 5), // changes position of shadow
                    ),
                  ],
                  color: Color(0xFF1d6614),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    "Book",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
