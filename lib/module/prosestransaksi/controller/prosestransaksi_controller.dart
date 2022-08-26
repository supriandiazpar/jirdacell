import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/prosestransaksi_view.dart';

class ProsestransaksiController extends GetxController {
  ProsestransaksiView? view;

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

  void prosesTransaksi(String d) async {
    try {
      await FirebaseFirestore.instance
          .collection("transaksi")
          .doc(d)
          .update({"status": "Selesai"});
      Get.snackbar("Sukses", "Status Transaksi Sudah Selesai", backgroundColor: Colors.green[300]);
    } on FirebaseException catch (e) {
      Get.snackbar("Gagal", e.toString());
    }
  }
}
