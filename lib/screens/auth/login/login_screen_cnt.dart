import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_app/screens/auth/otp/otp_screen.dart';

class LoginScreenCnt extends GetxController {
  final phoneNumberController = TextEditingController();
  final countryDialCode = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or state here
  }

  void getOTP() async {
    try {
      isLoading(true);

      await Future.delayed(
        Duration(seconds: 1),
        () => Get.to(OtpScreen()),
      ); // Simulate network call
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
