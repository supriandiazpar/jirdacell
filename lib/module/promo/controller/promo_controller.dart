import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/promo_view.dart';

class PromoController extends GetxController {
  PromoView? view;

  final GlobalKey<FormState> keyformpromo = GlobalKey<FormState>();
  late TextEditingController tanggalPromo = TextEditingController();
  late TextEditingController judulPromo = TextEditingController();
  late TextEditingController ketPromo = TextEditingController();

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

  void save(String doc) async {
    try {
      if (keyformpromo.currentState!.validate()) {
        await FirebaseFirestore.instance.collection("promo").doc(doc).set({
          "admin": dataUser.email,
          "tanggal_promo": tanggalPromo.text,
          "judul_promo": judulPromo.text,
          "ket_promo" : ketPromo.text
        });
        Get.snackbar("Sukses", "Promo Sudah Ditambahkan",
            backgroundColor: Colors.green[300]);
        tanggalPromo.clear();
        judulPromo.clear();
        ketPromo.clear();
      }
    } on FirebaseException catch (e) {
      Get.snackbar("Kesalahan", e.toString(), backgroundColor: Colors.red[400]);
    }
    catch (e){
      Get.snackbar("Kesalahan Sistem", e.toString());
    }
  }
}
