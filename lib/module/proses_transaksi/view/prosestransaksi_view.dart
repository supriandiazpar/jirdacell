import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/prosestransaksi_controller.dart';

import 'package:get/get.dart';

class ProsestransaksiView extends StatelessWidget {
  const ProsestransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProsestransaksiController>(
      init: ProsestransaksiController(),
      builder: (controller) {
        controller.view = this;

        double widthdevice = MediaQuery.of(context).size.width;
        double hightdevice = MediaQuery.of(context).size.height;
        double paddingBottom = MediaQuery.of(context).padding.bottom;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("Riwayat Transaksi"),
          );
        }

        double hightBody = hightdevice - paddingBottom - myAppbar().preferredSize.height;

        return Scaffold(
            appBar: myAppbar(),
            body: Container(
              padding: const EdgeInsets.all(8.0),
              width: widthdevice,
              height: hightBody,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("transaksi")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (!snapshot.hasData) return const Text("No Data");
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);
                        return InkWell(
                          onTap: () =>
                              controller.prosesTransaksi(data.docs[index].id),
                          child: Card(
                            child: ListTile(
                              title: Text("${item["keterangan"]}"),
                              subtitle: Text(
                                  "${item["harga"]} Point - Oleh ${item["email"]}"),
                              trailing: Text("${item["status"]}",
                                  style: TextStyle(
                                      color: item["status"] == "Selesai"
                                          ? Colors.green
                                          : Colors.red)),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ));
      },
    );
  }
}
