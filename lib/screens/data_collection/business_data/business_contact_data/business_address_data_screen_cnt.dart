// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BusinessAddressDataScreenCnt extends GetxController {
//   RxBool isLoading = false.obs;

//   final addressLine1Controller = TextEditingController();
//   final addressLine2Controller = TextEditingController();
//   final cityController = TextEditingController();
//   final stateController = TextEditingController();
//   final pincodeController = TextEditingController();
//   final googleMapURLController = TextEditingController();
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
