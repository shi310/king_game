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

  static MyAssets get footerLeftIcon => MyAssets(name: 'footer_left_icon', style: MyAssetStyle.svg);
  static MyAssets get footerRightIcon => MyAssets(name: 'footer_right_icon', style: MyAssetStyle.svg);
  static MyAssets get footerSelected => MyAssets(name: 'footer_selected', style: MyAssetStyle.png);
  static MyAssets get footerGames => MyAssets(name: 'footer_games', style: MyAssetStyle.png);
  static MyAssets get footerStore => MyAssets(name: 'footer_store', style: MyAssetStyle.png);
  static MyAssets get footerMine => MyAssets(name: 'footer_mine', style: MyAssetStyle.png);
}