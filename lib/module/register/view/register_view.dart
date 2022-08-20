import 'package:flutter/material.dart';
import 'package:jc/module/login/view/login_view.dart';
import '../controller/register_controller.dart';

import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Container(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: controller.keyform,
              child: Container(
                width: Get.width / 1,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: ListView(
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "Grosir Pulsa Dan Voucher Internet",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      "Nama",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.nama,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Masukan Nama"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Tidak Boleh';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Telepon",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.telepon,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "0812 xxxx",
                          ),
                          validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Hp Tidak Boleh Kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "contoh@gmail.com",
                          ),
                          validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Tidak Boleh Kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: controller.password,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Tidak Boleh Kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ElevatedButton(
                        onPressed: ()  => controller.doRegister(),
                        child: const Text("Register")),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        const Text("Sudah Punya Akun ? "),
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Text(
                            "Login Disini",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
