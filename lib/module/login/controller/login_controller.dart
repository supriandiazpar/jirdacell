import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/module/main_navigation/view/main_navigation_view.dart';
import '../view/login_view.dart';

class LoginController extends GetxController {
  LoginView? view;

  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  final GlobalKey<FormState> loginform = GlobalKey<FormState>();

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

  void doLogin() async {
    try {
      if (loginform.currentState!.validate()) {
      await  FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: password.text
            );
            email.clear();
            password.clear();
        Get.offAll(const MainNavigationView());
      }
    } on FirebaseException catch (e) {
      Get.snackbar("Ada Kesalahan", e.toString(),backgroundColor: Colors.red[400]);
    }
  }

}
