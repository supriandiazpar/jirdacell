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
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("produk")
                    .where("sub_kategori", isEqualTo: "Produk Fisik")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (!snapshot.hasData) return const Text("Tidak Ada Data");
                  final data = snapshot.data!;
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                    },
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () => Get.defaultDialog(
                                  //   title: "Pembelian",
                                  //   middleText: "${item["nama_produk"]}",
                                  //   cancel: ElevatedButton(
                                  //     onPressed: ()=> Get.back(),
                                  //     child: const Text("Batal")),
                                  //     confirm: ElevatedButton(
                                  //       onPressed: ()=> controller.beliProduk(item["harga"], item["nama_produk"]),
                                  //       child: const Text("Ya"),)
                                  // ),
                                  // child: const Text("Beli"),
                                  // )
                                ]),
                          ),
                        );
                      });
                }),
          ),
        );
      },
    );
  }
}
