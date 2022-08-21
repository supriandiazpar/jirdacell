import 'package:flutter/material.dart';
import '../controller/addproduk_controller.dart';

import 'package:get/get.dart';

class AddprodukView extends StatelessWidget {
  const AddprodukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddprodukController>(
      init: AddprodukController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Tambah Produk"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.keyAddProduk,
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
                      hintText: "Nama Produk"
                      ),
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
                  Obx(()=>
                  DropdownButton<String>(
                    onChanged: (String? newValue){
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
                    "Harga Pulsa",
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
                      border: OutlineInputBorder(),
                      hintText: "Stock"
                      ),
                  ),
                  const SizedBox(
                      height: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: ()=>controller.doAdd(),
                    child: const Text("Simpan"))
                ],
              ),
            ),
          )
        );
      },
    );
  }
}