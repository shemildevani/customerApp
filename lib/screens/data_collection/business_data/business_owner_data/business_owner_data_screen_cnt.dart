// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:customer_app/screens/data_collection/user_data/user_data_screen_cnt.dart';

// import 'owner_form_bundle.dart'; // <-- the class above

// class BusinessOwnerDataScreenCnt extends GetxController {
//   final phoneNumberController = TextEditingController();
//   final countryDialCode = ''.obs;
//   final owners = <OwnerFormBundle>[].obs;
//   UserDataScreenCnt userDataScreenCnt = Get.find<UserDataScreenCnt>();

//   @override
//   void onInit() {
//     super.onInit();
//     fillFirstOwnerFromUserData();
//   }

//   void fillFirstOwnerFromUserData() {
//     if (owners.isEmpty) owners.add(OwnerFormBundle());
//     final owner = owners.first;
//     owner.firstName.text = userDataScreenCnt.firstNameController.text;
//     owner.lastName.text = userDataScreenCnt.lastNameController.text;
//     owner.email.text = userDataScreenCnt.emailController.text;
//     owner.city.text = userDataScreenCnt.cityController.text;
//     owner.state.text = userDataScreenCnt.stateController.text;
//     owner.pincode.text = userDataScreenCnt.pincodeController.text;
//     owner.phone.text = userDataScreenCnt.phoneNumberController.text;
//     owner.countryDialCode.value = userDataScreenCnt.countryDialCode.value;
//   }

//   void addOwner() {
//     owners.add(OwnerFormBundle());
//   }

//   void removeOwner(int index) {
//     if (owners.length <= 1) return;
//     owners[index].dispose();
//     owners.removeAt(index);
//   }

//   List<Map<String, String>>? saveAll() {
//     bool allValid = true;
//     for (final bundle in owners) {
//       final currentValid = bundle.formKey.currentState?.validate() ?? false;
//       if (!currentValid) allValid = false;
//     }
//     if (!allValid) return null;

//     return owners
//         .map(
//           (b) => {
//             'firstName': b.firstName.text.trim(),
//             'lastName': b.lastName.text.trim(),
//             'email': b.email.text.trim(),
//             'city': b.city.text.trim(),
//             'state': b.state.text.trim(),
//             'pincode': b.pincode.text.trim(),
//             'phone':
//                 '${b.countryDialCode.value}${b.phone.text.trim()}', // full number
//           },
//         )
//         .toList();
//   }

//   @override
//   void onClose() {
//     phoneNumberController.dispose();
//     for (final b in owners) {
//       b.dispose();
//     }
//     super.onClose();
//   }
// }
