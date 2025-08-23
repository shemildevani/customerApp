import 'package:get/get.dart';
import 'dart:async';

import 'package:customer_app/screens/data_collection/user_data/user_data_screen.dart';

class OtpScreenCnt extends GetxController {
  // Remaining seconds (start at 59)
  var remainingSeconds = 59.obs;
  Timer? _timer;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    remainingSeconds.value = 59; // start at 59 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  String maskPhoneNumber(String phoneNumber) {
    final number = phoneNumber.split(' ').last;
    final dialCode = phoneNumber.split(' ').first;

    String maskedPart =
        '*' * (number.length - 5); // Mask remaining digits except last 2
    String visiblePart = number.substring(number.length - 2);
    return dialCode + maskedPart + visiblePart;
  }

  void optVerifyFunc() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 3));
      Get.to(UserDataScreen());
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }

  void resetTimer() {
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
