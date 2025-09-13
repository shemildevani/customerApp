import 'package:customer_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_app/config/app_constant/app_string.dart';
import 'package:customer_app/screens/data_collection/user_data/user_data_screen_cnt.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_button.dart';
import 'package:customer_app/shared/widgets/app_textbox.dart'
    show AppTextField1;
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:customer_app/shared/widgets/getback.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(UserDataScreenCnt());
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        appBar: buildAppBar(title: 'User Information', centerTitle: true),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppPadding.appPadding,

            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Form(
                key: cnt.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField1(
                      controller: cnt.firstNameController,
                      titleText: AppStringConst.firstName,
                      hintText: AppStringConst.firstName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),

                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.lastNameController,
                      titleText: AppStringConst.lastName,
                      hintText: AppStringConst.lastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),

                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.emailController,
                      titleText: AppStringConst.email,
                      hintText: AppStringConst.email,
                      isRequired: false,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.cityController,
                      titleText: AppStringConst.city,
                      hintText: AppStringConst.city,
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),

                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.stateController,
                      titleText: AppStringConst.state,
                      hintText: AppStringConst.state,
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your state';
                        }
                        return null;
                      },
                    ),
                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.pincodeController,
                      titleText: AppStringConst.pincode,
                      hintText: AppStringConst.pincode,
                      keyboardType: TextInputType.number,
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your pincode';
                        }
                        if (!GetUtils.isNumericOnly(value)) {
                          return 'Please enter a valid pincode';
                        }
                        return null;
                      },
                    ),
                    AppSpacing.h24,

                    Obx(
                      () => AppButton(
                        text: AppStringConst.submit,
                        isLoading: cnt.isLoading.value,

                        onPressed: () {
                          cnt.submitData();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
