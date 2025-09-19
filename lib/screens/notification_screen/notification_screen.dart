import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Notifications'),
      body: SafeArea(child: Padding(
        padding: AppPadding.appPadding,
        child: Column(
          children: [
            Container()
          ],
        ),
      )),
    );
  }
}