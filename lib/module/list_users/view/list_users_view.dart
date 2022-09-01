import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/list_users_controller.dart';

class ListUserView extends StatelessWidget {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListUsersController>(
      init: ListUsersController(),
      builder: (controller) {
        controller.view = this;

        double widthDevice = MediaQuery.of(context).size.width;
        double heightDevice = MediaQuery.of(context).size.height;
        double paddingBottom = MediaQuery.of(context).padding.bottom;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("List Pelanggan"),
            elevation: 0,
          );
        }

        double heihtBody =
            heightDevice - myAppbar().preferredSize.height - paddingBottom;

        return Scaffold(
            appBar: myAppbar(),
            body: Container(
              height: heihtBody,
              width: widthDevice,
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Container(
                      height: heihtBody * 0.13,
                      width: widthDevice,
                      color: Colors.deepPurple[500],
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              hintText: "Cari Nama Pelanggan",
                              ),
                          onSubmitted: (value) {
                            controller.cariUsers = value;
                            controller.update();
                          },
                        ),
                      )),
                  Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              if (snapshot.hasError) {
                                return const Text("Error");
                              }
                              if (!snapshot.hasData) {
                                return const Text("Tidak Ada Data");
                              }
                              final filter = snapshot.data!.docs.where(
                                  (element) => (element.data()
                                          as Map<String, dynamic>)["nama"]
                                      .toLowerCase().toString()
                                      .contains(controller.cariUsers.toLowerCase()));
                                      if (filter.isNotEmpty == true) {
                              return ListView.builder(
                                itemCount: filter.length,
                                itemBuilder: ((context, index) {
                                  var item = (filter.elementAt(index));
                                  (item["nama"].toLowerCase().contains(
                                      controller.cariUsers.toLowerCase()));
                                  return Card(
                                    child: ListTile(
                                      title: Text(
                                          "${item["nama"]}  ${item["saldo"]} Point"),
                                      subtitle: Text("${item["telepon"]}"),
                                      trailing: InkWell(
                                        onTap: () => Get.defaultDialog(
                                            title: "Hapus Users",
                                            middleText: "${item["nama"]}",
                                            cancel: ElevatedButton(
                                                onPressed: () => Get.back(),
                                                child: const Text("Batal")),
                                            confirm: ElevatedButton(
                                              onPressed: () =>
                                                  controller.hapusUsers(filter
                                                      .elementAt(index)
                                                      .id),
                                              child: const Text("Ya"),
                                            )),
                                        child: const Icon(Icons.delete),
                                      ),
                                    ),
                                  );
                                }),
                              );
                                      }
                                      else {
                                        return const Center(child: Text("Users Tidak Ditemukan", style: TextStyle(fontSize: 18),));
                                      }
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }))
                ],
              ),
            ));
      },
    );
  }
}
