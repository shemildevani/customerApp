import 'package:get/get.dart';

class OfferScreenCnt extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> getOfferList() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      // Handle any errors if necessary
    } finally {
      isLoading(false);
    }
  }
}
