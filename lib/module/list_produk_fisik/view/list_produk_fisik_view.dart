import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jc/module/edit_produk_fisik/view/edit_produk_fisik_view.dart';
import 'package:jc/module/list_produk_fisik/controller/list_produk_fisik_controller.dart';

class ListProdukFisikView extends StatelessWidget {
  const ListProdukFisikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListProdukFisikController>(
      init: ListProdukFisikController(),
      builder: (controller) {
        controller.view = this;

        double heightDevice = MediaQuery.of(context).size.height;
        double widthDevice = MediaQuery.of(context).size.width;
        double paddingBottom = MediaQuery.of(context).padding.bottom;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("List Produk"),
          );
        }

        double heightbody =
            heightDevice - myAppbar().preferredSize.height - paddingBottom;

        return Scaffold(
          appBar: myAppbar(),
          body: SizedBox(
            width: widthDevice,
            height: heightbody,
            child: Column(
              children: [
                SizedBox(
                    height: heightbody * 0.10,
                    child: Card(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Cari Produk"),
                        onSubmitted: (value) {
                          controller.cariProduk = value;
                          controller.update();
                        },
                      ),
                    )),
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("produk")
                            .where("sub_kategori", isEqualTo: "Produk Fisik")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            final filter = snapshot.data!.docs.where(
                                (element) => (element.data()
                                        as Map<String, dynamic>)["nama_produk"]
                                    .toLowerCase()
                                    .contains(
                                        controller.cariProduk.toLowerCase()));
                            return ListView.builder(
                              itemCount: filter.length,
                              itemBuilder: ((context, index) {
                                var item = (filter.elementAt(index));
                                (item["nama_produk"].toLowerCase().contains(
                                    controller.cariProduk.toLowerCase()));
                                return InkWell(
                                  onTap: () => Get.to(
                                       const EditProdukFisikView(),
                                      arguments: filter.elementAt(index).id),
                                  child: Card(
                                    child: ListTile(
                                      title: Text("${item["nama_produk"]}"),
                                      subtitle: Text("${item["harga"]}"),
                                      trailing: Image.network(
                                        "${item["path"]}",
                                        height: 70,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }))
              ],
            ),
          ),
        );
      },
    );
  }
}
