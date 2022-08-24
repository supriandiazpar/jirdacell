import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/pln_view.dart';

class PlnController extends GetxController {
  PlnView? view;

  int saldo = 0;

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

   void beliToken(int hargaToken, String produk) async {
    try {
      final doc = profileUser;
      final data = await doc.get();
      data.data() as Map<String, dynamic>;
      saldo = data["saldo"];
      if (saldo >= hargaToken) {
        await profileUser.update({"saldo": FieldValue.increment(-hargaToken)});
        await FirebaseFirestore.instance.collection("transaksi").add({
          "uid": dataUser.uid,
          "email": dataUser.email,
          "harga": hargaToken,
          "keterangan": produk,
          "status": "Sedang Diproses"
        });
        Get.back();
      Get.snackbar("Sukses", "Akan Segera Diproses",
          backgroundColor: Colors.green[400]);
      }
      else {
        Get.back();
        Get.snackbar("Warning!!", "Saldo Anda Tidak Cukup", backgroundColor: Colors.red[400]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}