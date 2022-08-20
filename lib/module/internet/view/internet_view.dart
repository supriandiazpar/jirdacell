import 'package:flutter/material.dart';
import '../controller/internet_controller.dart';

import 'package:get/get.dart';

class InternetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(
      init: InternetController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Voucher Internet"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const <Widget> [
                 Card(
                  child: ListTile(
                    title: Text('Telkomsel 1 GB 3 Hari'),
                    subtitle: Text("9500"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Telkomsel 1,5 GB 5 Hari'),
                    subtitle: Text("11000"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Telkomsel 4 GB 5 Hari',),
                    subtitle: Text("23000"),
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