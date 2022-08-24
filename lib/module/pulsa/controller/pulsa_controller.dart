import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/pulsa_view.dart';

class PulsaController extends GetxController {
  PulsaView? view;

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

  void beliPulsa(int hargaPulsa, String produk) async {
    try {
      final doc = profileUser;
      final data = await doc.get();
      data.data() as Map<String, dynamic>;
      saldo = data["saldo"];
      if (saldo >= hargaPulsa) {
        await profileUser.update({"saldo": FieldValue.increment(-hargaPulsa)});
        await FirebaseFirestore.instance.collection("transaksi").add({
          "uid": dataUser.uid,
          "email": dataUser.email,
          "harga": hargaPulsa,
          "keterangan": "Pembelian Pulsa",
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
