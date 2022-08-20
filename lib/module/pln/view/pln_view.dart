import 'package:flutter/material.dart';
import '../controller/pln_controller.dart';

import 'package:get/get.dart';

class PlnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlnController>(
      init: PlnController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Token PLN Promo"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const <Widget> [
                 Card(
                  child: ListTile(
                    title: Text('TLN 20K'),
                    subtitle: Text("20000"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('PLN 50k'),
                    subtitle: Text("50000"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            
          ),
        );
      },
    );
  }
}