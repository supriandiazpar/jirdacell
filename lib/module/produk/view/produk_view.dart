import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            title: const Text("Grosir Acc Handphone"),
            elevation: 0,
          ),
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  width: Get.width,
                  height: Get.height * 0.10,
                  color: Colors.deepPurple[500],
                  child: Card(
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Cari Produk"),
                      onSubmitted: (text) {
                        controller.cariProduk = text;
                        controller.update();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot<Object?>>(
                      stream: FirebaseFirestore.instance
                          .collection("produk")
                          .where("sub_kategori", isEqualTo: "Produk Fisik")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final filter = snapshot.data!.docs.where((element) =>
                              (element.data()
                                      as Map<String, dynamic>)["nama_produk"]
                                  .toLowerCase()
                                  .contains(controller.cariProduk.toLowerCase()));
                          if (snapshot.hasError) {
                            return const Text("Error");
                          } else if (!snapshot.hasData) {
                            return const Text("Tidak Ada Data");
                          }
                          if (filter.isNotEmpty == true) {
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                ),
                                itemCount: filter.length,
                                itemBuilder: (context, index) {
                                  var item = (filter.elementAt(index));
                                  (item["nama_produk"].toLowerCase().contains(
                                      controller.cariProduk.toLowerCase()));
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Image.network(
                                                item["path"],
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12.0,
                                            ),
                                            Text(
                                              "${item["nama_produk"]}",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. ${item["harga"]}",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 16,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ]),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                              child: Text(
                                "Produk Tidak Ditemukan",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
