import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseExtension on FirebaseAuth {
  wait() async {
    bool ready = false;
    FirebaseAuth.instance.authStateChanges().listen((event) {
      ready = true;
    });

    while (ready == false) {
      await Future.delayed(const Duration(milliseconds: 250));
    }

    print(
        "FirebaseAuth.instance.currentUser: ${FirebaseAuth.instance.currentUser != null}");
    print("Firebase OK!");
  }
}
