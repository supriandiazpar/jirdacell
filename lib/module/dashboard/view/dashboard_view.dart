import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jc/data/session.dart';
import 'package:jc/module/internet/view/internet_view.dart';
import 'package:jc/module/pln/view/pln_view.dart';
import 'package:jc/module/produk/view/produk_view.dart';
import 'package:jc/module/pulsa/view/pulsa_view.dart';
import 'package:jc/module/qrcode/view/qrcode_view.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Jirda Cell"),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 210,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 210,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                            ),
                            Container(
                              height: 150,
                              decoration:
                                  const BoxDecoration(color: Colors.deepPurple),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Rp. ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  StreamBuilder<DocumentSnapshot>(
                                      stream: profileUser.snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) return  const Text("Ada Kesalahan");
                                        if (!snapshot.hasData) return const Text("No Data");
                                        Map item =
                                            (snapshot.data!.data() as Map);
                                        return Text(
                                          '${item["saldo"]}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 15,
                              right: 15,
                              child: SizedBox(
                                height: 100,
                                child: Card(
                                  elevation: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () => Get.to(PulsaView()),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon/pulsa.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'Pulsa',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      InkWell(
                                        onTap: () => Get.to(PlnView()),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon/pln.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'PLN',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      InkWell(
                                        onTap: () => Get.to(InternetView()),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon/internet.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'Internet',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      InkWell(
                                        onTap: () => Get.to(ProdukView()),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon/shopping.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'Belanja',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      InkWell(
                                        onTap: () => Get.to(QrcodeView()),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icon/qrcode.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'QR Code',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: 150,
                      width: Get.width / 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Promo Hari Ini",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/image/bonus_buat_akun.png',
                              height: 100,
                              ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: 150,
                      width: Get.width / 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Promo Akan Datang",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Image.asset(
                            'assets/image/bonus_belanja.png',
                            height: 100,
                            )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
