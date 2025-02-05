part of 'api.dart';

class _User {
  // 用户信息
  final String getInfo = '/user/info';
  // 更新用户信息
  final String updateInfo = '/user/update';
  // 钻石兑换抽奖券
  final String exchangeDiamond = '/user/exchange';
  // 获取银行卡信息
  final String getBankCard = '/user/updateBank';
  // 获取银行列表
  final String getBankList = '/bank/bankList';
  // 支付下单
  final String payOrder = '/order/payOrder';
}