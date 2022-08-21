import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/pulsa_view.dart';

class PulsaController extends GetxController {
  PulsaView? view;

  int hargaPulsa = 0;
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

  void beliPulsa(int hargaPulsa) async {
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
          "keterangan": "Pembelian Pulsa"
        });
        Get.back();
      Get.snackbar("Sukses", "Menunggu Proses Admin",
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
