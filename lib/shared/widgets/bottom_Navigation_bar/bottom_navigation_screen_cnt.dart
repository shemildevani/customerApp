import 'package:get/get.dart';

class BottomNavigationScreenCnt extends GetxController {
  var selectedIndex = 0.obs; // Observed variable for selected index

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
