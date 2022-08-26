import 'package:flutter/material.dart';
import '../controller/addpulsa_controller.dart';

import 'package:get/get.dart';

class AddpulsaView extends StatelessWidget {
  const AddpulsaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddpulsaController>(
      init: AddpulsaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Tambahkan Produk Digital"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Produk"
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
                    onPressed: (){},
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