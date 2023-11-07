import 'package:get/get.dart';
import 'package:prova_flutter/pages/login/login_mixin.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController with LoginMixin {
  Future<void> openGoogle() async {
    const url = 'https://www.google.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Não foi possível abrir $url';
    }
  }

  bool checkFields() {
    if (username.value.isEmpty || password.value.isEmpty) {
      return false;
    } else if (password.value.length < 2) {
      return false;
    } else if (password.value.trim() != password.value) {
      return false;
    } else if (username.value.length > 20 || password.value.length > 20) {
      return false;
    } else if (username.value.endsWith(' ') || password.value.endsWith(' ')) {
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password.value)) {
      return false;
    }
    return true;
  }
}
