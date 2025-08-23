// import 'dart:io';

// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_owner_data/business_owner_data_screen.dart';

// class BusinessDataCnt extends GetxController {
//   RxBool isLoading = false.obs;
//   final businessNameCnt = TextEditingController();
//   final openTimeCnt = TextEditingController();
//   final closeTimeCnt = TextEditingController();
//   final addressLine1Cnt = TextEditingController();
//   final addressLine2Cnt = TextEditingController();
//   final pincodeCnt = TextEditingController();
//   final gstNoCnt = TextEditingController();
//   final descriptionCnt = TextEditingController();
//   final googleMapURL = TextEditingController();
//   final Rx<File?> shopLogoFile = Rx<File?>(null);
//   final userDataFormKey = GlobalKey<FormState>();
//   final formKey = GlobalKey<FormState>();
//   final businessType = ''.obs;
//   final businessCategory = ''.obs;

//   Future<void> saveData() async {
//     try {
//       // if (formKey.currentState!.validate()) {
//       formKey.currentState!.save();
//       Get.to(BusinessOwnerDataScreen());
//       // }
//     } catch (e) {
//       //
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> pickShopLogo() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       shopLogoFile.value = File(pickedFile.path);
//     }
//   }
// }
