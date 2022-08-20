import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jc/data/session.dart';
import '../view/edit_profile_view.dart';

class EditProfileController extends GetxController {
  EditProfileView? view;

  late ImagePicker imagePicker;

  XFile? pickedImage;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void onInit() {
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectImage() async {
    try {
      final dataImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (dataImage != null) {
        pickedImage = dataImage;
      }
      update();
    } catch (e) {
      pickedImage = null;
      Get.snackbar("Ada Masalah", e.toString());
      update();
    }
  }

 Future<String?> uploadImage() async {
    String uid = dataUser.uid;
    Reference storageRef = storage.ref("Profile/$uid");
    File file = File(pickedImage!.path);
    try {
      await storageRef.putFile(file);
      final photoUrl = await storageRef.getDownloadURL();
      return photoUrl;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

 void dosave( String url) async {
    try {
      await profileUser.update({"profile": url});
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
