import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:posyandu/Page/IbuHamil/BukuIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/HomePageIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/JadwalIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/ProfilIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/RiwayatIbuHamilPage.dart';

import '../../Model/IbuHamilModel.dart';

class ButtonNavIbuHamilController extends GetxController {
  Rx<PersistentTabController> tabController =
      PersistentTabController(initialIndex: 0).obs;
}

class ButtonNavBarIbuHamil extends StatefulWidget {
  ButtonNavBarIbuHamil({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<ButtonNavBarIbuHamil> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBarIbuHamil> {
  var buttonNavIbuHamilController = Get.put(ButtonNavIbuHamilController());
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        HomePageIbuHamil(
          ibuHamilModel: widget.ibuHamilModel,
        ),
        const JadwalIbuHamilPage(),
        BukuIbuHamilPage(ibuHamilModel: widget.ibuHamilModel),
        RiwayatIbuHamilPage(ibuHamilModel: widget.ibuHamilModel),
        ProfilIbuHamilPage(ibuHamilModel: widget.ibuHamilModel),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: Color.fromARGB(255, 0, 62, 16),
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.timer),
          title: ("Jadwal"),
          activeColorPrimary: Color.fromARGB(255, 0, 62, 16),
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.book_fill),
          title: ("Buku Ibu"),
          activeColorPrimary: Color.fromARGB(255, 0, 62, 16),
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.square_list),
          title: ("Riwayat"),
          activeColorPrimary: Color.fromARGB(255, 0, 62, 16),
          inactiveColorPrimary: CupertinoColors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_crop_circle),
          title: ("Profil"),
          activeColorPrimary: Color.fromARGB(255, 0, 62, 16),
          inactiveColorPrimary: CupertinoColors.black,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: buttonNavIbuHamilController.tabController.value,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Color.fromARGB(255, 113, 223, 117), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
