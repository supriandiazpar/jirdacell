import 'dart:io';
import 'package:flutter/material.dart';
import '../controller/produkfisik_controller.dart';
import 'package:get/get.dart';

class ProdukfisikView extends StatelessWidget {
  const ProdukfisikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdukfisikController>(
      init: ProdukfisikController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text("Tambah Produk Fisik"),
            ),
            body: Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
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
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.namaProduk,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nama Produk"),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Kategori",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Obx(
                      () => DropdownButton<String>(
                        onChanged: (String? newValue) {
                          controller.kategoriValue.value = newValue!;
                        },
                        value: controller.kategoriValue.value,
                        items: controller.items.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Harga",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.hargaProduk,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Harga",
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Stock Masuk",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.stockMasuk,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Stock"),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Keterangan",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.keteranganProduk,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Keterangan"),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    InkWell(
                      onTap: () => controller.selectImage(),
                      child: GetBuilder<ProdukfisikController>(
                          builder: (c) => c.pickedImage != null
                              ? Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(
                                              File(c.pickedImage!.path)),
                                          fit: BoxFit.cover)))
                              : Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/icon/no-image.png"))),
                                )),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      onPressed: () => controller.uploadImage(controller.namaProduk).then((url) {
                        if (url != null) {
                          controller.saveProduk(url);
                        }
                      }),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
