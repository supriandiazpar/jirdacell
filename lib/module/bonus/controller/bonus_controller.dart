import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/data/session.dart';
import '../view/bonus_view.dart';

class BonusController extends GetxController {
  BonusView? view;

  int addBonus = 0;
  int uSaldo = 0;
  String docBonus = "";
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

  uProfile() async {
    try {
      final saldoSekarang = await profileUser.get();
      saldoSekarang.data({"saldo"});
      
      profileUser.update({"saldo": addBonus});
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void doKlaim() async {
    try {
      await FirebaseFirestore.instance
          .collection("bonus")
          .doc(docBonus)
          .update({"status": 0});
      uProfile();
      Get.snackbar("Sukses", "Periksa Saldo Anda",
          backgroundColor: Colors.green[300]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
