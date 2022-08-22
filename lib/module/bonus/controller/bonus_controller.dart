import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/data/session.dart';
import '../view/bonus_view.dart';

class BonusController extends GetxController {
  BonusView? view;

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

  void doKlaim(String d, int b) async {
    try {
      await FirebaseFirestore.instance
          .collection("bonus")
          .doc(d)
          .update({"status": 0});

      //add saldo
      await profileUser.update({
        "saldo": FieldValue.increment(b),
      });
      Get.snackbar("Sukses", "Saldo Sudah Ditambahkan",
          backgroundColor: Colors.green[300]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
