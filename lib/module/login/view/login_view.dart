import 'package:flutter/material.dart';
import 'package:jc/module/register/view/register_view.dart';
import '../controller/login_controller.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.deepPurple,
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 250,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: Image.asset(
                  "assets/icon/gambar_login.png",
                ),
              ),
             Form(
              key: controller.loginform,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 400,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Jirda Cell - Konter Pulsa Grosir Termurah",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            ),
                            validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Tidak Boleh';
                        }
                        return null;
                      },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Password"),
                            validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () => controller.doLogin(),
                        child: const Text("Login"),
                      ),
                      Row(
                        children: [
                          const Text("Belum Punya Akun ?  "),
                          InkWell(
                            onTap: () => Get.to(RegisterView()),
                            child: const Text("Daftar Disini", style: TextStyle(color: Colors.deepPurple),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
