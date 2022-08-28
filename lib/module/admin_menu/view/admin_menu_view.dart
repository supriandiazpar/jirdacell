import 'package:flutter/material.dart';
import '../../add_produk/view/addproduk_view.dart';
import '../../produk_fisik/view/produkfisik_view.dart';
import '../../promo/view/promo_view.dart';
import '../../proses_transaksi/view/prosestransaksi_view.dart';
import '../controller/admin_menu_controller.dart';

import 'package:get/get.dart';

class AdminMenuView extends StatelessWidget {
  const AdminMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminMenuController>(
      init: AdminMenuController(),
      builder: (controller) {
        controller.view = this;

        double widthdevice = MediaQuery.of(context).size.width;
        double hightdevice = MediaQuery.of(context).size.height;
        double paddingBottom = MediaQuery.of(context).padding.bottom;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("Menu Admin"),
          );
        }

        double hightBody =
            hightdevice - paddingBottom - myAppbar().preferredSize.height;

        return Scaffold(
            appBar: myAppbar(),
            body: Container(
              padding: const EdgeInsets.all(15.0),
              width: widthdevice,
              height: hightBody,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/produk_digital.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "Add Admin",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const AddprodukView()),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/produk_fisik.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "Produk Digital",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const ProdukfisikView()),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/menu_produk.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "Produk Fisik",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const ProsestransaksiView()),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/menu_transaksi.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "Transaksi",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const PromoView()),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/menu_promo.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "Add Promo",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
