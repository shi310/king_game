part of 'theme.dart';

class MyIcons {
  MyIcons._internal();

  static MyAssets get logo => MyAssets(name: 'logo', style: MyAssetStyle.png);


  static AssetImage get loginBackground => const AssetImage('assets/images/login_background.png');
  static MyAssets get loginEmail => MyAssets(name: 'login_email', style: MyAssetStyle.svg);
  static MyAssets get loginPhone => MyAssets(name: 'login_phone', style: MyAssetStyle.svg);
  static MyAssets get loginGoogle => MyAssets(name: 'login_google', style: MyAssetStyle.svg);
  static MyAssets get loginFacebook => MyAssets(name: 'login_facebook', style: MyAssetStyle.svg);
  static MyAssets get loginGuest => MyAssets(name: 'login_guest', style: MyAssetStyle.svg);

}