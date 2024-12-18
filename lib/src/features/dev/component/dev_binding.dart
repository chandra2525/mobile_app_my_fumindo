import 'package:get/get.dart';
import 'dev_controller.dart';

class DevBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DevController(),
    );
  }
}
