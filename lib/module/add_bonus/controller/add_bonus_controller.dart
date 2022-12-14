import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/data/session.dart';
import '../view/add_bonus_view.dart';

class AddBonusController extends GetxController {
  AddBonusView? view;

  String filterTelepon = "";
  late TextEditingController textTelepon = TextEditingController();
  late TextEditingController textNama = TextEditingController();
  late TextEditingController textKeterangan = TextEditingController();
  late TextEditingController textBonus = TextEditingController();
  late TextEditingController textUid = TextEditingController();

  late List<String> items = <String>[
    "Pembelian Pulsa",
    "Pembelian Paket Internet",
    "Pembelian Token",
    "Kembalian Uang"
  ];
  RxString kategoriValue = "Pembelian Pulsa".obs;

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

  void doSave() async {
    try {
     await FirebaseFirestore.instance.collection("bonus").add({
        "uid": textUid.text,
        "admin" :dataUser.email,
        "nama": textNama.text,
        "telepon": textTelepon.text,
        "keterangan": kategoriValue.toString(),
        "bonus": int.parse(textBonus.text),
        "tanggal": Timestamp.now(),
        "status": 1
      });
      filterTelepon ="";
      Get.back();
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
