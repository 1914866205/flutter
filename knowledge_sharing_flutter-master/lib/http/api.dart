class Api {
  static String baseUrl = "http://content.utools.club/";
  static String userCener = "http://nttneiwang.utools.club/";

  ///获取分享信息
  static String getShareInfo = baseUrl + 'share/query';
  ///获取兑换信息
  static String getExchangeShareInfo = baseUrl + 'share/exchange/shares';
  ///模糊搜搜
  static String search = baseUrl + 'share/keywords';
  ///我的发帖
  static String myContribution = baseUrl + 'share/my';

  ///登录
  static String login = userCener + 'user/login';
  ///查询积分
  static String bonusDetail = userCener + 'user/bonus/my';
}
