import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/list_users_view.dart';

class ListUsersController extends GetxController {
  ListUserView? view;

String cariUsers = "";

  @override
  void onInit() {
    super.onInit();
  }

  // allPoint ()  async{
  //  final data = await FirebaseFirestore.instance.collection("users").doc().get();
  //  data.data() as Map<String, dynamic>;
  //  print(data["saldo"]);
  // //return saldo;
  // }

  void hapusUsers(String doc) async {
    try {
    await  FirebaseFirestore.instance.collection("users").doc(doc).delete();
    Get.back();
      Get.snackbar("Sukses", "Users Telah Di Hapus",
          backgroundColor: Colors.green[400]);
    } on FirebaseException catch (e) {
      Get.snackbar("Gagal", e.toString(), backgroundColor: Colors.red[400]);
      Get.back();
    }
  }
}
