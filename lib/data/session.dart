import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

get dataUser {
  return FirebaseAuth.instance.currentUser;
}

DocumentReference get profileUser {
  return FirebaseFirestore.instance.collection("users").doc(dataUser.uid);
}

// DocumentReference get getSaldo {
//   final doc = FirebaseFirestore.instance.collection("users").doc(dataUser.uid);
//  final data =  doc.get();
//   data.data(as Map<String, dynamic>;
// }