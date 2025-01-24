import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginController extends GetxController {
  final state = LoginState();

  final accountController = TextEditingController();
  final accountFocusNode = FocusNode();

  final codeController = TextEditingController();
  final codeFocusNode = FocusNode();

  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(Duration(milliseconds: 500));
    await state.config.update();
  }

  void onLogin() {
    // print(state.config.toJson());
  }
}
