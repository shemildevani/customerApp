// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BusinessSocialDataCnt extends GetxController {
//   RxBool isLoading = false.obs;
//   final phoneNumberController = TextEditingController();
//   final countryDialCode = ''.obs;
//   final emailController = TextEditingController();
//   final facebookLinkController = TextEditingController();
//   final instagramLinkController = TextEditingController();
//   final websiteLinkController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   void submitData() async {
//     try {
//       isLoading(true);
//       if (formKey.currentState?.validate() ?? false) {
//         formKey.currentState?.save();
//       }
//     } catch (e) {
//       // Handle any errors that occur during submission
//     } finally {
//       isLoading(false);
//     }
//   }
// }
