import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_int/controllers/home_controller.dart';
import 'package:api_int/controllers/bottom_nav_controller.dart';
import 'package:api_int/controllers/top_nav_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final TopNavController topNavController = Get.put(TopNavController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildNavItem('For you', 0),
              _buildNavItem('Today', 1),
              _buildNavItem('Following', 2),
              _buildNavItem('Recipes', 3),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            return bottomNavController.currentPage;
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Obx(
                  () => BottomNavigationBar(
                    currentIndex: bottomNavController.selectedIndex.value,
                    onTap: bottomNavController.changeIndex,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notifications),
                          label: 'Notifications'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_2), label: 'Profile'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return Obx(() {
      bool isSelected = topNavController.selectedIndex.value == index;

      return GestureDetector(
        onTap: () {
          topNavController.changeIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    });
  }
}
