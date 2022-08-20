import 'package:flutter/material.dart';
import 'package:jc/module/bonus/view/bonus_view.dart';
import 'package:jc/module/dashboard/view/dashboard_view.dart';
import 'package:jc/module/profile/view/profile_view.dart';
import 'package:jc/module/transaksi/view/transaksi_view.dart';
import '../controller/main_navigation_controller.dart';

import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;
          return Scaffold(
            backgroundColor: Colors.deepPurple,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [DashboardView(),BonusView(),TransaksiView(), ProfileView()],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
           // backgroundColor: Colors.black12,
            unselectedItemColor: Colors.black38,
            selectedItemColor: Colors.deepPurple,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.auto_awesome_outlined ,
                label: 'Bonus',
              ),
              _bottomNavigationBarItem(
                icon: Icons.add_shopping_cart_rounded,
                label: 'Transaksi',
              ),
              _bottomNavigationBarItem(
                icon: Icons.person,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
   _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}