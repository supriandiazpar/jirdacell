import 'package:get/get.dart';
import '../view/main_navigation_view.dart';

class MainNavigationController extends GetxController {
  MainNavigationView? view;

  @override
  void onInit() {
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

  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}