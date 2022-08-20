import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jc/module/login/view/login_view.dart';
import 'package:jc/module/main_navigation/view/main_navigation_view.dart';
import 'package:jc/utilities/imageminversion.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

Widget mainView = const LoginView();
if(FirebaseAuth.instance.currentUser != null){
mainView = const MainNavigationView();
}

  return runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  const LoginView()));
}