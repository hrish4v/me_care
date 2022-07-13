import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  FirebaseFirestore _doctors = FirebaseFirestore.instance;
  late String city;
  late String spec;
  FireStoreServices({required this.city, required this.spec});
  void getDoctors() async {
    await _doctors.collection("city").doc(city).collection(spec).get();
  }
}
