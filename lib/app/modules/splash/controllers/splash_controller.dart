import 'package:get/get.dart';
import 'package:ticket_quick_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () async {
      Get.toNamed(Routes.LOGIN);
    });
  }
}
