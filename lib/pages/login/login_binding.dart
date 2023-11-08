import 'package:get/get.dart';
import 'package:prova_flutter/pages/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
