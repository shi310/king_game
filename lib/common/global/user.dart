import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

class UserController extends GetxService with WidgetsBindingObserver {
  static UserController get to => Get.find();

  // 初始化等待方法
  final Completer<void> _initCompleter = Completer<void>();
  Future<void> get initComplete => _initCompleter.future;

  MyDio? myDio;

  List<String> baseUrlList = [];

  List<String> wssUrlList = [];

  String userToken = '';

  final userInfo = UserModel.empty().obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _initCompleter.complete();
    MyLogger.w('UserController 初始化完毕...');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // 监视 App 是否切换到后台
    switch (state) {
      case AppLifecycleState.resumed:
        MyLogger.w('app 切换到了前台');
        break;
      case AppLifecycleState.paused:
        MyLogger.w('app 切换到了后台');
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  Future<void> updateUserInfo({
    void Function()? onSuccess,
    void Function(String)? onError,
  }) async {
    await userInfo.value.update(
      onSuccess: onSuccess,
      onError: onError,
    );
    userInfo.refresh();
  }
}