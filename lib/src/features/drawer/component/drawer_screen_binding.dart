import 'package:get/get.dart';
import '../../../repositories/user_repository.dart';
import 'drawer_screen_controller.dart';

class DrawerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DrawerScreenController(
      userRepository: Get.find<UserRepository>(),
    ));
  }
}
