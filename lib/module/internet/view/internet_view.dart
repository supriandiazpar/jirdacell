import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/internet_controller.dart';

import 'package:get/get.dart';

class InternetView extends StatelessWidget {
  const InternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(
      init: InternetController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Promo Paket Internet"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("produk")
                    .where("kategori", isEqualTo: "Paket Internet")
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
                                title: "Beli Produk ?",
                                middleText: "${item["nama_produk"]}",
                                cancel: ElevatedButton(
                                  onPressed: ()=> Get.back(),
                                  child: const Text("Batal")),
                                  confirm: ElevatedButton(
                                    onPressed: ()=> controller.beliPaket(item["harga"], item["nama_produk"]),
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