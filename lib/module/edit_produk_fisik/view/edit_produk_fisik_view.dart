import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/module/edit_produk_fisik/controller/edit_produk_fisik_controller.dart';

class EditProdukFisikView extends GetView<EditProdukFisikController> {
  const EditProdukFisikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProdukFisikController>(
        init: EditProdukFisikController(),
        builder: (controller) {
          controller.view = this;

          double heightDevice = MediaQuery.of(context).size.height;
          double widthDevice = MediaQuery.of(context).size.width;

          AppBar myAppbar() {
            return AppBar(
              title: const Text("Form Edit Produk"),
            );
          }

          return Scaffold(
            appBar: myAppbar(),
            body: Container(
                height: heightDevice,
                width: widthDevice,
                padding: const EdgeInsets.all(15.0),
                child: FutureBuilder<DocumentSnapshot<Object?>>(
                    future: controller.getData(Get.arguments),
                    builder: (context, snapshot) {
                      //  if(snapshot.connectionState == ConnectionState.done){
                      if (snapshot.hasError) {
                        return const Text("Error");
                      }
                      if (!snapshot.hasData) {
                        return const Text("Tidak ada data");
                      }
                      var data = snapshot.data!.data() as Map<String, dynamic>;
                      if (controller.namaProduk.text.isEmpty ||
                          controller.hargaProduk.text.isEmpty ||
                          controller.stockProduk.text.isEmpty ||
                          controller.keteranganProduk.text.isEmpty) {
                        controller.namaProduk.text = data["nama_produk"];
                        controller.hargaProduk.text = "${data["harga"]}";
                        controller.stockProduk.text = "${data["stock"]}";
                        controller.keteranganProduk.text = data["keterangan"];
                      }
                      controller.kategoriValue.value = data["kategori"];
                      controller.pathImage = data["path"];
                      return Form(
                          key: controller.keyFormf,
                          child: ListView(
                            children: [
                              const Text(
                                "Nama Produk",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: controller.namaProduk,
                                autocorrect: false,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Nama Produk"),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Kategori",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Obx(
                                () => DropdownButton<String>(
                                  onChanged: (String? newValue) {
                                    controller.kategoriValue.value = newValue!;
                                  },
                                  value: controller.kategoriValue.value,
                                  items: controller.items
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              const Text(
                                "Harga",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: controller.hargaProduk,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Harga Produk",
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Stock",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: controller.stockProduk,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Stock Produk"),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Detail Produk",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: controller.keteranganProduk,
                                maxLines: 5,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Detail Produk",
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => controller.selectImage(),
                                    child: const Text("Edit Image"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              controller.pickedImage != null
                                  ? Container(
                                      width: widthDevice,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(File(controller
                                                  .pickedImage!.path)),
                                              fit: BoxFit.cover)))
                                  : Container(
                                      width: widthDevice,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${data["path"]}"))),
                                    ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (controller.pickedImage == null){
                                      return controller.editProduk(
                                          snapshot.data!.id);}
                                          else {
                                            controller
                          .uploadImage(controller.namaProduk)
                          .then((url) {
                        if (url != null) {
                          controller.withImage(url, snapshot.data!.id);
                        }
                      });
                                          }
                                  },
                                  child: const Text("Simpan"))
                              //     ElevatedButton(
                              //   onPressed: ()   => controller
                              //       .uploadImage(controller.namaProduk)
                              //       .then((url) {
                              //     if (url != null) {
                              //       controller.editProduk(url, snapshot.data!.id);
                              //     }
                              //   }),
                              //   child: const Text(
                              //     "Simpan",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold, fontSize: 18),
                              //   ),
                              // )
                            ],
                          ));
                      // }//snapshot status
                      // else {
                      //   return CircularProgressIndicator();
                      // }
                    })),
          );
        });
  }
}
