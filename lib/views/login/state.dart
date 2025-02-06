import 'package:get/get.dart';
import 'package:king_game/common/common.dart';

class LoginState {
  String title = 'Login View';

  final _captchaButtonText = Lang.loginViewSendCode.tr.obs;
  String get captchaButtonText => _captchaButtonText.value;
  set captchaButtonText(String value) => _captchaButtonText.value = value;

  LoginModel loginModel = LoginModel.empty();

  int captchaCountdown = 60;

  ConfigModel config = ConfigModel.empty();
}
