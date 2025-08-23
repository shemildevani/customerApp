import 'package:customer_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/shared/widgets/bottom_Navigation_bar/bottom_navigation_screen_cnt.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationScreenCnt cnt = Get.put(BottomNavigationScreenCnt());

    final List<Widget> screens = [
      HomeScreen(),
      SecondScreen(),
      ThirdScreen(),
      FourthScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[cnt.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: cnt.selectedIndex.value,
          backgroundColor: AppColors.white,
          onTap: (index) {
            cnt.changeIndex(index);
          },
          items: [
            buildBottomNavigationBarItem(icon: Icons.home, label: 'Home'),
            buildBottomNavigationBarItem(icon: Icons.tablet, label: 'Tablet'),
            buildBottomNavigationBarItem(icon: Icons.add, label: 'Favorite'),
            buildBottomNavigationBarItem(
              icon: Icons.person_outline,
              label: 'Profile',
            ),
          ],

          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey2,
          showUnselectedLabels: true,
          selectedFontSize: AppFontSize.s14,
          unselectedFontSize: AppFontSize.s14,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
