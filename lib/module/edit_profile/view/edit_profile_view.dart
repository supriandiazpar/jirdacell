import 'dart:io';

import 'package:flutter/material.dart';
import '../controller/edit_profile_controller.dart';

import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Profile"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => controller.uploadImage().
                  then((hasil) {
                    if (hasil !=null){
                      controller.dosave(hasil);
                    }
                  }),
                  child: const Icon(Icons.save_sharp),
                ),
              )
            ],
          ),
          body: Center(
              child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GetBuilder<EditProfileController>(
                  builder: (c) => c.pickedImage !=null ?
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: FileImage(
                                      File(c.pickedImage!.path)),
                                  fit: BoxFit.cover))
                    ) :
                     Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(
                                    "assets/icon/profile_default.png")
                                  )
                                  ),
                    )
                  
                ), 


                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => controller.selectImage(),
                  child: const Text("Pilih Foto"),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
