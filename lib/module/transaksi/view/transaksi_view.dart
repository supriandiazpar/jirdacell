import 'package:flutter/material.dart';
import '../controller/transaksi_controller.dart';

import 'package:get/get.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(
      init: TransaksiController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Transaksi"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}