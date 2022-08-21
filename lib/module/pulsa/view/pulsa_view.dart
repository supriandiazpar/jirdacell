import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/pulsa_controller.dart';

import 'package:get/get.dart';

class PulsaView extends StatelessWidget {
  const PulsaView({Key? key}) : super(key: key);

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
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("produk")
                    .where("kategori", isEqualTo: "Pulsa")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (!snapshot.hasData) return const Text("No Data");
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      var item = (data.docs[index].data() as Map);
                      return Card(
                        child: ListTile(
                          title: Text("${item["nama_produk"]}"),
                          subtitle: Text("Rp. ${item["harga"]}"),
                          trailing: ElevatedButton(
                              onPressed: () => Get.defaultDialog(
                                title: "Pembelian",
                                middleText: "${item["nama_produk"]}",
                                cancel: ElevatedButton(
                                  onPressed: ()=> Get.back(),
                                  child: const Text("Batal")),
                                  confirm: ElevatedButton(
                                    onPressed: ()=> controller.beliPulsa(item["harga"]),
                                    child: const Text("Ya"),)
                              ),
                              child: const Text("Beli")),
                        ),
                      );
                    },
                  );
                }),
          ),
        );
      },
    );
  }
}
