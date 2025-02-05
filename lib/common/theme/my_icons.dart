part of 'theme.dart';

class MyIcons {
  MyIcons._internal();

  static MyAssets get logo => MyAssets(name: 'logo', style: MyAssetStyle.png);


  static AssetImage get loginBackground => MyAssets.image('login_background');
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

  static MyAssets get headerAdd1 => MyAssets(name: 'header_add_1', style: MyAssetStyle.svg);
  static MyAssets get headerAdd2 => MyAssets(name: 'header_add_2', style: MyAssetStyle.svg);
  static MyAssets get headerAvatarBackground => MyAssets(name: 'header_avatar_background', style: MyAssetStyle.svg);
  static MyAssets get headerBackground1 => MyAssets(name: 'header_background_1', style: MyAssetStyle.png, width: double.infinity, fit: BoxFit.fill,);
  static MyAssets get headerBackground2 => MyAssets(name: 'header_background_2', style: MyAssetStyle.png, fit: BoxFit.fill,);
  static MyAssets get headerCard => MyAssets(name: 'header_card', style: MyAssetStyle.svg);
  static MyAssets get headerStone => MyAssets(name: 'header_stone', style: MyAssetStyle.svg);
  static MyAssets get headerAvatar => MyAssets(name: 'header_avatar', style: MyAssetStyle.png);
  static AssetImage get headerBackground => MyAssets.image('header_background');

  static AssetImage get gameBackground => MyAssets.image('game_background');
  static AssetImage gameBanner(int index) => MyAssets.image('game_banner_$index');
  static MyAssets gamePicture1(int index) => MyAssets(name: 'game_${index}_1', style: MyAssetStyle.png, fit: BoxFit.fill);
  static MyAssets gamePicture2(int index) => MyAssets(name: 'game_${index}_2', style: MyAssetStyle.png, width: double.infinity, fit: BoxFit.fitWidth);
  static MyAssets gameIcon(int index) => MyAssets(name: 'game_${index}_icon', style: MyAssetStyle.png);
  static MyAssets gameTitle(int index) => MyAssets(name: 'game_${index}_title', style: MyAssetStyle.png);
  static MyAssets get gameTimer => MyAssets(name: 'game_timer', style: MyAssetStyle.png);

}