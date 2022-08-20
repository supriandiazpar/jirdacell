import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jc/module/login/view/login_view.dart';
import '../view/profile_view.dart';

class ProfileController extends GetxController {
  ProfileView? view;

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

  void doLogout() async {
    await  FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
  }
}