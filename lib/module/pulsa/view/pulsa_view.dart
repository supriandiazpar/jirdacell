import 'package:flutter/material.dart';
import '../controller/pulsa_controller.dart';

import 'package:get/get.dart';

class PulsaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PulsaController>(
      init: PulsaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Pulsa Promo"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const <Widget> [
                 Card(
                  child: ListTile(
                    title: Text('Telkomsel 5k'),
                    subtitle: Text("5500"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Telkomsel 10k'),
                    subtitle: Text("10500"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Telkomsel 15k',),
                    subtitle: Text("15500"),
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