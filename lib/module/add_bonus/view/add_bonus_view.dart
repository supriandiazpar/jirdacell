import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/add_bonus_controller.dart';

import 'package:get/get.dart';

class AddBonusView extends StatelessWidget {
  const AddBonusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBonusController>(
      init: AddBonusController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Kasih Bonus Pelanggan"),
          ),
          body: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Masukan Nomor HP Pelanggan"),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (text) {
                        controller.filterTelepon = text;
                        controller.update();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .where("telepon", isEqualTo: controller.filterTelepon)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasError) return const Text("Error");
                          if (!snapshot.hasData) return const Text("No Data");
                          final data = snapshot.data!;
                          return ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) {
                                var item = (data.docs[index].data() as Map);
                                controller.textUid.text = data.docs[index].id;
                                controller.textTelepon.text = item["telepon"];
                                controller.textNama.text = item["nama"];
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: controller.textNama,
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        TextField(
                                          controller: controller.textTelepon,
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Obx(
                                          () => DropdownButton<String>(
                                            onChanged: (String? newValue) {
                                              controller.kategoriValue.value =
                                                  newValue!;
                                            },
                                            value:
                                                controller.kategoriValue.value,
                                            items: controller.items
                                                .map<DropdownMenuItem<String>>(
                                              (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          controller: controller.textBonus,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Jumlah Bonus"),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        ElevatedButton(
                                          onPressed: () => controller.doSave(),
                                          child: const Text("Kirim"),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
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
