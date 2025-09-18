import 'package:get/get.dart';

class ProfileScreenCnt extends GetxController {
  RxBool isNotificationOn = true.obs;
  var isLoading = false.obs;

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }
}
