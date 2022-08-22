import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jc/data/session.dart';
import 'package:jc/module/add_bonus/view/add_bonus_view.dart';
import '../controller/bonus_controller.dart';

import 'package:get/get.dart';

class BonusView extends StatelessWidget {
  const BonusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BonusController>(
      init: BonusController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Klaim Bonus Anda"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: StreamBuilder<DocumentSnapshot>(
                    stream: profileUser.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (!snapshot.hasData) return const Text("anynom");
                      Map item = (snapshot.data!.data()) as Map;
                      return (item["status"] == 1)
                          ? InkWell(
                              onTap: () => Get.to(const AddBonusView()),
                              child: const Icon(Icons.add),
                            )
                          : const Text("");
                    }),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("bonus")
                    .where("uid", isEqualTo: dataUser.uid)
                    .where("status", isEqualTo: 1)
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
                          subtitle: Text("Rp. ${item["bonus"]}"),
                          trailing: ElevatedButton(
                              onPressed: () => controller.doKlaim(data.docs[index].id, item["bonus"] ),
                              child: const Text("Klaim")),
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
