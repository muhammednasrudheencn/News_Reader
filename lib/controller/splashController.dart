import 'package:get/get.dart';
import 'package:newsreadera/screen/Home/homeScreen.dart';

class SplashController extends GetxController {
  Future<void> navigateToHome() async {
    var splashDuration = const Duration(milliseconds: 1000);
    await Future.delayed(splashDuration);
    Get.off(() => const HomeScreen());
  }
}
