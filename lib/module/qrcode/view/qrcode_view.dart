import 'package:flutter/material.dart';
import '../controller/qrcode_controller.dart';

import 'package:get/get.dart';

class QrcodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrcodeController>(
      init: QrcodeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Qrcode"),
          ),
        );
      },
    );
  }
}