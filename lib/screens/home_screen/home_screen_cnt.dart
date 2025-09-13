import 'package:get/get.dart';

class HomeScreenCnt extends GetxController {
  RxInt selectedIndex = 0.obs;
  final RxnString lastScan = RxnString(null);
  RxBool isLoading = false.obs;

  void getBusinessList() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 5));
    isLoading.value = false;
  }
}
