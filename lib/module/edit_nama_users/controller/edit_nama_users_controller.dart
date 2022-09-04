import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/data/session.dart';
import '../view/edit_nama_users_view.dart';

class EditNamaUsersController extends GetxController {
  EditNamaUsersView? view;

  late TextEditingController namaUsers;

  @override
  void onInit() {
    namaUsers = TextEditingController();
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

  Future<DocumentSnapshot<Object?>> getData() {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("users").doc(profileUser.id);
    return docRef.get();
  }

   void editProfile() async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(profileUser.id).update({
        "nama": namaUsers.text,
      });
      Get.back();
      Get.snackbar("Sukses", "Nama Sudah Di Ubah", backgroundColor: Colors.green[400]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red[400]);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}