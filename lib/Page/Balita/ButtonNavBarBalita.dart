import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Page/Balita/BukuBalitaPage.dart';
import 'package:posyandu/Page/Balita/HomePageBalita.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/ProfilBalitaPage.dart';
import 'package:posyandu/Page/Balita/RiwayatBalitaPage.dart';

class ButtonNavBalitaController extends GetxController {
  Rx<PersistentTabController> tabController =
      PersistentTabController(initialIndex: 0).obs;
}

class ButtonNavBarBalita extends StatefulWidget {
  ButtonNavBarBalita({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<ButtonNavBarBalita> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBarBalita> {
  var buttonNavBalitaController = Get.put(ButtonNavBalitaController());

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        HomePageBalita(
          balitaModel: widget.balitaModel,
        ),
        const JadwalBalitaPage(),
        BukuBalitaPage(
          balitaModel: widget.balitaModel,
        ),
        RiwayatBalitaPage(
          balitaModel: widget.balitaModel,
        ),
        ProfilBalitaPage(
          balitaModel: widget.balitaModel,
        )
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
          title: ("Buku Anak"),
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

    return Obx(() => PersistentTabView(
          context,
          controller: buttonNavBalitaController.tabController.value,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.green, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0),
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

          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ));
  }
}
