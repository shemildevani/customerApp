import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/screens/favourite_screen/favourite_screen.dart';
import 'package:customer_app/screens/home_screen/home_screen.dart';
import 'package:customer_app/screens/profile_screen/profile_screen.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/shared/widgets/bottom_Navigation_bar/bottom_navigation_screen_cnt.dart';

// class BottomNavigationScreen extends StatelessWidget {
//   const BottomNavigationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BottomNavigationScreenCnt cnt = Get.put(BottomNavigationScreenCnt());

//     final List<Widget> screens = [
//       HomeScreen(),
//       SecondScreen(),
//       FavouriteScreen(),
//       ProfileScreen(),
//     ];

//     return Scaffold(
//       body: Obx(() => screens[cnt.selectedIndex.value]),
//       bottomNavigationBar: SafeArea(
//         child: Obx(
//           () => Theme(
//             data: Theme.of(context).copyWith(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//             ),
//             child: BottomNavigationBar(
//               currentIndex: cnt.selectedIndex.value,
//               backgroundColor: AppColors.white,
//               onTap: (index) {
//                 cnt.changeIndex(index);
//               },

//               items: [
//                 buildBottomNavigationBarItem(
//                   icon: Icons.home,
//                   label: 'Home',
//                   index: 0,
//                   selectedIndex: cnt.selectedIndex.value,
//                 ),
//                 buildBottomNavigationBarItem(
//                   icon: Icons.local_offer_outlined,
//                   label: 'Offers',
//                   index: 1,
//                   selectedIndex: cnt.selectedIndex.value,
//                 ),
//                 buildBottomNavigationBarItem(
//                   icon: Icons.favorite_border,
//                   label: 'Favorite',
//                   index: 2,
//                   selectedIndex: cnt.selectedIndex.value,
//                 ),
//                 buildBottomNavigationBarItem(
//                   icon: Icons.person_outline,
//                   label: 'Profile',
//                   index: 3,
//                   selectedIndex: cnt.selectedIndex.value,
//                 ),
//               ],

//               selectedItemColor: AppColors.primary,
//               unselectedItemColor: AppColors.grey2,
//               showUnselectedLabels: false,
//               iconSize: 28,
//               elevation: 8,
//               selectedLabelStyle: const TextStyle(fontSize: 0), // 👈 add this
//               unselectedLabelStyle: const TextStyle(fontSize: 0),
//               showSelectedLabels: false,
//               selectedFontSize: AppFontSize.s14,
//               unselectedFontSize: AppFontSize.s14,
//               type: BottomNavigationBarType.fixed,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   BottomNavigationBarItem buildBottomNavigationBarItem({
//     required IconData icon,
//     required String label,
//     required int index,
//     required int selectedIndex,
//   }) {
//     final bool isSelected = index == selectedIndex;

//     return BottomNavigationBarItem(
//       icon: Container(
//         decoration: BoxDecoration(
//           border:
//               isSelected
//                   ? Border(top: BorderSide(color: AppColors.primary, width: 1))
//                   : null,
//         ),
//         padding: const EdgeInsets.only(top: 6, left: 8, right: 8),
//         child: Column(
//           children: [
//             Icon(icon, color: isSelected ? AppColors.primary : AppColors.grey2),
//             AppText(
//               text: label,
//               color: isSelected ? AppColors.primary : AppColors.grey2,
//               fontSize: AppFontSize.s14,
//               fontWeight: isSelected ? appBoldFont : null,
//             ),
//           ],
//         ),
//       ),
//       label: '',
//     );
//   }
// }

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

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationScreenCnt cnt = Get.put(BottomNavigationScreenCnt());

    final List<Widget> screens = [
      HomeScreen(),
      SecondScreen(),
      FavouriteScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[cnt.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: cnt.selectedIndex.value,
            backgroundColor: AppColors.white,
            onTap: (index) {
              cnt.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0, // disable default label
            unselectedFontSize: 0,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey2,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: IconThemeData(
              size: 18,
              color: AppColors.grey2,
            ),
            selectedIconTheme: IconThemeData(size: 20),
            // landscapeLayout: ,
            items: [
              buildBottomNavigationBarItem(
                icondata: FontAwesomeIcons.house,
                label: 'Home',
                isSelected: cnt.selectedIndex.value == 0,
              ),
              buildBottomNavigationBarItem(
                icondata: FontAwesomeIcons.capsules,
                label: 'Remedy',
                isSelected: cnt.selectedIndex.value == 1,
              ),
              buildBottomNavigationBarItem(
                icondata: FontAwesomeIcons.heart,
                label: 'Patient',
                isSelected: cnt.selectedIndex.value == 2,
              ),
              buildBottomNavigationBarItem(
                icondata: FontAwesomeIcons.user,
                label: 'Favorite',
                isSelected: cnt.selectedIndex.value == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    String? icon,
    required String label,
    IconData? icondata,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      label: '',
      icon: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration:
            isSelected
                ? BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.primary, width: 2),
                  ),
                )
                : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icondata != null
                ? Icon(icondata)
                : SvgPicture.asset(icon!, height: 24),
            SizedBox(height: 4),
            AppText(
              text: label,
              fontSize: AppFontSize.s12,
              fontWeight: appMediumFont,
              color: isSelected ? AppColors.primary : AppColors.grey2,
            ),
          ],
        ),
      ),
    );
  }
}
