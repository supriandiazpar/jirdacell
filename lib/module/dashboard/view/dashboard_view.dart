import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

        double widthdevice = MediaQuery.of(context).size.width;
        double hightdevice = MediaQuery.of(context).size.height;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("Jirda Cell"),
          );
        }

        DateTime tglfull = Timestamp.now().toDate();
        String tglPromo = DateFormat('yyyy-MM-dd').format(tglfull);

        return Scaffold(
          appBar: myAppbar(),
          body: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 210,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: widthdevice,
                          height: hightdevice * 0.32,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                        ),
                        Container(
                          width: widthdevice,
                          height: hightdevice * 0.25,
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Point Anda",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    StreamBuilder<DocumentSnapshot>(
                                        stream: profileUser.snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return const Text("Ada Kesalahan");
                                          }
                                          if (!snapshot.hasData) {
                                            return const Text("0");
                                          }
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
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: hightdevice * 0.15,
                          left: 15,
                          right: 15,
                          child: SizedBox(
                            height: hightdevice * 0.15,
                            child: Card(
                              elevation: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => Get.to(const PulsaView()),
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
                                    onTap: () => Get.to(const PlnView()),
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
                                    onTap: () => Get.to(const InternetView()),
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
                                    onTap: () => Get.to(const ProdukView()),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Promo Hari Ini",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("promo")
                            .where("tanggal_promo", isEqualTo: tglPromo)
                            .limit(1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error");
                          }
                          if (!snapshot.hasData) {
                            return Center(
                                child: Image.asset(
                              'assets/image/promo_default.png',
                            ));
                          }
                          final data = snapshot.data!;
                          var item = (data.docs.first.data() as Map);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  "${item["judul_promo"]}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                    "${item["tanggal_promo"]} - ${item["ket_promo"]}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                                trailing: Image.asset(
                                  'assets/icon/open-box.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Promo Akan Datang",
                        style: TextStyle(fontSize: 20),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("promo")
                              .orderBy("tanggal_promo")
                              .limit(1)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Error");
                            }
                            if (!snapshot.hasData) {
                              return const Text("No Data");
                            }
                            final data = snapshot.data!;
                            var item = (data.docs.first.data() as Map);
                            return Card(
                              child: ListTile(
                                title: Text(
                                  "${item["judul_promo"]}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                    "${item["tanggal_promo"]} - ${item["ket_promo"]}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                                trailing: Image.asset(
                                  'assets/icon/kotak_kado.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
