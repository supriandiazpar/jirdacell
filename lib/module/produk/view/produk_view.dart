import 'package:flutter/material.dart';
import '../controller/produk_controller.dart';

import 'package:get/get.dart';

class ProdukView extends StatelessWidget {
  const ProdukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdukController>(
      init: ProdukController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Barang Grosir"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Maaf, Menu Ini Masih Dalam Pengembangan"),
          ),
        );
      },
    );
  }
}