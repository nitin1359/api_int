import 'package:api_int/pages/home_page.dart';
import 'package:api_int/pages/notifications_page.dart';
import 'package:api_int/pages/profile_page.dart';
import 'package:api_int/pages/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get currentPage => pages[selectedIndex.value];
}
