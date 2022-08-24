import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jc/module/login/view/login_view.dart';
import '../../../data/session.dart';
import '../view/profile_view.dart';

class ProfileController extends GetxController {
  ProfileView? view;
int status =0;

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

// Future<int> cekUser () async {
//   final doc = profileUser;
//       final data = await doc.get();
//       data.data() as Map<String, dynamic>;
//       status = data["status"];
//       return status;

// }
  void doLogout() async {
    await  FirebaseAuth.instance.signOut();
    Get.deleteAll();
    Get.offAll(const LoginView());
  }
}