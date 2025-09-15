import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:customer_app/shared/widgets/app_snackbar.dart';
import 'package:get/get.dart';

class NoInternetConnectionScreenCnt extends GetxController {
  final Connectivity _connectivity = Connectivity();
  RxBool isConnected = true.obs;
  RxBool isLoading = false.obs;
  bool _snackbarShown = false;

  @override
  void onInit() {
    _initConnectivityMonitoring();
    super.onInit();
  }

  void _initConnectivityMonitoring() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final hasConnection = !results.contains(ConnectivityResult.none);
    isConnected.value = hasConnection;

    if (!hasConnection && !_snackbarShown) {
      _snackbarShown = true;

      showAppSnackBar('No Internet Connection',duration: Duration(days: 1));
    } else if (hasConnection && _snackbarShown) {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }

      showAppSnackBar('You\'re back online!');

      _snackbarShown = false;
    }
  }
}
