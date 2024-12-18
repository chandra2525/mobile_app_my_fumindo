import 'package:get/get.dart';
import '../../../repositories/user_repository.dart';
import 'drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DrawerScreenController(
      userRepository: Get.find<UserRepository>(),
    ));
  }
}
