import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/edit_nama_users_controller.dart';

import 'package:get/get.dart';

class EditNamaUsersView extends StatelessWidget {
  const EditNamaUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNamaUsersController>(
      init: EditNamaUsersController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Nama Profile"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<DocumentSnapshot<Object?>>(
              future: controller.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                      return const Text("Error");
                    }
                    if (!snapshot.hasData) {
                      return const Text("Tidak ada data");
                    }
                    var data = snapshot.data!.data() as Map<String, dynamic>;
                    controller.namaUsers.text = data["nama"];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 8.0,
                    ),
                    TextField(
                      controller: controller.namaUsers,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nama"
                      ),
                    ),
                    const SizedBox(
                        height: 15.0,
                    ),
                    
                    ElevatedButton(
                      onPressed: () => controller.editProfile(),
                      child: const Text("Save"))
                    
                  ],
                );
              }
            ),
          )
        );
      },
    );
  }
}