import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/session.dart';
import '../view/addproduk_view.dart';

class AddprodukController extends GetxController {
  AddprodukView? view;

  late List<String> items = <String>[
    "Pulsa",
    "Paket Internet",
    "Paket Teleon",
    "Token PLN",
    "Acc Handphone",
    "Elektronik"
  ];
  RxString kategoriValue = "Pulsa".obs;
  final GlobalKey<FormState> keyAddProduk = GlobalKey<FormState>();
  late TextEditingController namaProduk = TextEditingController();
  late TextEditingController hargaProduk = TextEditingController();
  late TextEditingController stockMasuk = TextEditingController();

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

  void doAdd() async {
    try {
      await FirebaseFirestore.instance.collection("produk").add({
        "admin": dataUser.email,
        "nama_produk": namaProduk.text,
        "kategori": kategoriValue.toString(),
        "harga": int.parse(hargaProduk.text),
        "stock": int.parse(stockMasuk.text),
      });
      namaProduk.clear();
      hargaProduk.clear();
      stockMasuk.clear();
      Get.snackbar("Sukses", "Produk Sudah Ditambahkan",
          backgroundColor: Colors.green[400]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red[400]);
    }
  }
}
