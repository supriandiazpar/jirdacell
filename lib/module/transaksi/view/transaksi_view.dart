import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jc/data/session.dart';
import '../controller/transaksi_controller.dart';

import 'package:get/get.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(
      init: TransaksiController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Transaksi"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("transaksi").where("uid", isEqualTo: dataUser.uid)
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
                          title: Text("${item["keterangan"]}"),
                          subtitle: Text("Rp. ${item["harga"]}"),
                          trailing: Text("${item["status"]}",
                          style: TextStyle(color: item["status"] =="Selesai" ? Colors.green : Colors.red, )),
                        ),
                      );
                    },
                  );
                }
                ),
          ),
        );
      },
    );
  }
}