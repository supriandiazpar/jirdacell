import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/promo_controller.dart';

import 'package:get/get.dart';

class PromoView extends StatelessWidget {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromoController>(
      init: PromoController(),
      builder: (controller) {
        controller.view = this;

        double widthdevice = MediaQuery.of(context).size.width;
        double hightdevice = MediaQuery.of(context).size.height;
        double paddingBottom = MediaQuery.of(context).padding.bottom;

        AppBar myAppbar() {
          return AppBar(
            title: const Text("Tambahkan Promo"),
          );
        }
        double hightBody = hightdevice - paddingBottom - myAppbar().preferredSize.height;

        return Scaffold(
          appBar: myAppbar(),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            width: widthdevice,
            height: hightBody,

            child: Form(
              key: controller.keyformpromo,
              child: ListView(
                children: [
                  const Text("Tanggal Promo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal Belum Di Isi';
                        }
                        return null;
                      },
                    controller: controller.tanggalPromo,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tanggal Promo"
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                         initialDate: DateTime.now(),
                         firstDate: DateTime(2022),
                         lastDate: DateTime(2023));
                         if(pickedDate  !=null){
                          String formatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          controller.tanggalPromo.text = formatDate;
                         }
                         else {
                          controller.tanggalPromo.clear();
                         }
                    },
                  ),
                  const SizedBox(
                      height: 12.0,
                  ),
                  const Text("Judul Promo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul Belum Di Isi';
                        }
                        return null;
                      },
                    controller: controller.judulPromo,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Judul Promo"
                    ),
                  ),
                   const SizedBox(
                      height: 12.0,
                  ),
                  const Text("Keterangan Promo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Keterangan Belum Di Isi';
                        }
                        return null;
                      },
                    controller: controller.ketPromo,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Keterangan Promo",
                    ),
                  ),
                  const SizedBox(
                      height: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: ()=> controller.save(controller.tanggalPromo.text),
                    child: const Text("Simpan"))
                ],
              )
              ),
          )
        );
      },
    );
  }
}