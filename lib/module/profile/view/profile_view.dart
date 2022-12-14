import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jc/data/session.dart';
import 'package:jc/module/admin_menu/view/admin_menu_view.dart';
import 'package:jc/module/edit_nama_users/view/edit_nama_users_view.dart';
import 'package:jc/module/edit_profile/view/edit_profile_view.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Informasi Akun"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () => controller.doLogout(),
                  child: const Icon(Icons.logout),
                ),
              )
            ],
          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: profileUser.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (!snapshot.hasData)
                        return const Text("Tidak Ada Data");
                      Map item = (snapshot.data!.data() as Map);
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              leading: (item["profile"] != "")
                                  ? Image.network(
                                      item["profile"],
                                      height: 60,
                                      width: 60,
                                    )
                                  : Image.asset(
                                      "assets/icon/profile_default.png",
                                      height: 50,
                                      width: 50,
                                    ),
                              title: const Text(
                                'Pelanggan Jirda Cell',
                              ),
                              trailing: InkWell(
                                onTap: () => Get.to(const EditProfileView()),
                                child: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(const EditNamaUsersView()),
                            child: Card(
                              child: ListTile(
                                title: const Text('Nama'),
                                subtitle: Text("${item["nama"]}"),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: const Text('Telepon'),
                              subtitle: Text("${item["telepon"]}"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: const Text(
                                'Email',
                              ),
                              subtitle: Text("${item["email"]}"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          StreamBuilder<DocumentSnapshot>(
                              stream: profileUser.snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError)
                                  return const Text("Error");
                                if (!snapshot.hasData)
                                  return const Text("anynom");
                                Map item = (snapshot.data!.data()) as Map;
                                return (item["status"] == 1)
                                    ? ElevatedButton(
                                        onPressed: () =>
                                            Get.to(const AdminMenuView()),
                                        child: const Text(
                                          "Menu Admin",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Container();
                              }),
                        ],
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
