import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/register_view.dart';

class RegisterController extends GetxController {
  RegisterView? view;

  late TextEditingController nama = TextEditingController();
  late TextEditingController telepon = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  final GlobalKey<FormState> keyform = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void doRegister() async {
    try {
      if (keyform.currentState!.validate()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        addProfile();
        Get.snackbar("Pendaftaran Berhasil", "Silahkan Login",
            backgroundColor: Colors.green[400]);
        nama.clear();
        telepon.clear();
        email.clear();
        password.clear();
      }
     
    } on FirebaseException catch (e) {
      Get.snackbar("Kesalahan", e.toString(), backgroundColor: Colors.red[400]);
      print(e);
    }
  }

  void addProfile() async {
    await FirebaseFirestore.instance.collection("users").doc(dataUser.uid).set({
      "nama": nama.text,
      "telepon": telepon.text,
      "email": email.text,
      "saldo": 500,
      "profile" : "",
      "status": 0
    });
  }

}
