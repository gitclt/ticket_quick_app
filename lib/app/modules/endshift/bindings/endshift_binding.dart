import 'package:get/get.dart';

import '../controllers/endshift_controller.dart';

class EndshiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndshiftController>(
      () => EndshiftController(),
    );
  }
}
