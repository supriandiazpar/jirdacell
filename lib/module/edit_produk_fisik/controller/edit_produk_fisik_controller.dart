import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jc/data/session.dart';
import 'package:jc/module/edit_produk_fisik/view/edit_produk_fisik_view.dart';

class EditProdukFisikController extends GetxController {
  EditProdukFisikView? view;

  late List<String> items = <String>["Acc Handphone", "Elektronik"];
  RxString kategoriValue = "Acc Handphon".obs;

  late TextEditingController namaProduk;
  late TextEditingController hargaProduk;
  late TextEditingController stockProduk;
  late TextEditingController keteranganProduk;
  final GlobalKey<FormState> keyFormf = GlobalKey<FormState>();

  late ImagePicker imagePicker;
  XFile? pickedImage;

  FirebaseStorage storage = FirebaseStorage.instance;

  String pathImage = "";

  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("produk").doc(docId);
    return docRef.get();
  }

  @override
  void onInit() {
    namaProduk = TextEditingController();
    hargaProduk = TextEditingController();
    stockProduk = TextEditingController();
    keteranganProduk = TextEditingController();
    imagePicker = ImagePicker();
    super.onInit();
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

  void editProduk(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("produk").doc(docId).update({
        "admin": dataUser.email,
        "nama_produk": namaProduk.text,
        "kategori": kategoriValue.toString(),
        "sub_kategori": "Produk Fisik",
        "harga": int.parse(hargaProduk.text),
        "stock": int.parse(stockProduk.text),
        "keterangan": keteranganProduk.text,
      });
      Get.back();

      Get.snackbar("Sukses", "Data Produk Sudah Di Ubah", backgroundColor: Colors.green[400]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red[400]);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void withImage(String url, String docId) async {
    try {
      await FirebaseFirestore.instance.collection("produk").doc(docId).update({
        "admin": dataUser.email,
        "nama_produk": namaProduk.text,
        "kategori": kategoriValue.toString(),
        "sub_kategori": "Produk Fisik",
        "harga": int.parse(hargaProduk.text),
        "stock": int.parse(stockProduk.text),
        "keterangan": keteranganProduk.text,
        "path" : url
      });
      Get.back();

      Get.snackbar("Sukses", "Data Produk Sudah Di Ubah", backgroundColor: Colors.green[400]);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red[400]);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  
}
