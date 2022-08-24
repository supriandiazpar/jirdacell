import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/session.dart';
import '../view/produkfisik_view.dart';

class ProdukfisikController extends GetxController {
  ProdukfisikView? view;

  late List<String> items = <String>[
    "Acc Handphone"
  ];
  RxString kategoriValue = "Acc Handphone".obs;
  final GlobalKey<FormState> keyFormf = GlobalKey<FormState>();
  late TextEditingController namaProduk = TextEditingController();
  late TextEditingController hargaProduk = TextEditingController();
  late TextEditingController stockMasuk = TextEditingController();
  late TextEditingController keteranganProduk= TextEditingController();

  late ImagePicker imagePicker;
  XFile? pickedImage;


  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void onInit() {
    imagePicker = ImagePicker();
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

  void selectImage() async {
    try {
      final dataImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (dataImage != null) {
        pickedImage = dataImage;
      }
      update();
    } catch (e) {
      pickedImage = null;
      Get.snackbar("Ada Masalah", e.toString());
      update();
    }
  }

   Future<String?> uploadImage(nmImage) async {
    Reference storageRef = storage.ref("produk/${nmImage.text}");
    File file = File(pickedImage!.path);
    try {
      await storageRef.putFile(file);
      final photoUrl = await storageRef.getDownloadURL();
      return photoUrl;
      
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  void saveProduk(String url) async {
    try {
      await FirebaseFirestore.instance.collection("produk").add({
        "admin": dataUser.email,
        "nama_produk": namaProduk.text,
        "kategori": kategoriValue.toString(),
        "sub_kategori": "Produk Fisik",
        "harga": int.parse(hargaProduk.text),
        "stock": int.parse(stockMasuk.text),
        "keterangan": keteranganProduk.text,
        "path" : url
      });
      Get.snackbar("Sukses", "Produk Sudah Ditambahkan",
      backgroundColor: Colors.green[400]);
      namaProduk.clear();
      hargaProduk.clear();
      stockMasuk.clear();
      keteranganProduk.clear();
      
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red[400]);
    }
    catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}