import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

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
    await Future.delayed(MyConfig.time.pageTransition);
    await getData();
  }

  Future<void> getData() async {
    await state.config.update();
  }

  void onLogin() {
    Get.offAllNamed(MyRoutes.applicationView);
  }
}
