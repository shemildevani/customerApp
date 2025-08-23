import 'package:customer_app/screens/home_screen/home_screen.dart';
import 'package:customer_app/shared/widgets/bottom_Navigation_bar/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_app/models/user_model.dart';
import 'package:customer_app/screens/data_collection/business_data/business_data/business_data_screen.dart';

class UserDataScreenCnt extends GetxController {
  final isLoading = false.obs;
  final phoneNumberController = TextEditingController();
  final countryDialCode = ''.obs;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();

  Rxn<UserModel> userModel = Rxn<UserModel>();

  void submitData() async {
    try {
      isLoading(true);
      // if (formKey.currentState?.validate() ?? false) {
      //   formKey.currentState?.save();
      Get.offAll(BottomNavigationScreen());
      // }
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }
}
