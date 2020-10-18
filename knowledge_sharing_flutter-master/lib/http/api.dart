class Api {
  static String baseUrl = "http://content.utools.club/";
  static String userCenter = "http://nttneiwang.utools.club/";

  ///获取分享信息
  static String getShareInfo = baseUrl + 'share/query';
  ///获取我的分享信息
  static String getMyShareInfo = baseUrl + 'share/query/my';
  ///获取兑换信息
  static String getExchangeShareInfo = baseUrl + 'share/exchange/shares';
  ///获取用户信息
  static String getUserInfo =userCenter+"user/find";
  ///模糊搜搜
  static String search = baseUrl + 'share/keywords';
  ///我的发帖
  static String myContribution = baseUrl + 'share/my';

  ///登录
  static String login = userCenter + 'user/login';
  ///查询积分
  static String bonusDetail = userCenter + 'user/bonus/my';
  ///兑换share
  static String exchangeShare=baseUrl+'/share/exchange';
  /// 签到
  static String sign=baseUrl+'/user/sign';
  ///积分日志
  static String bonusLog=baseUrl+'/user/bonusLog';
  /// 投稿
  static String contribute=baseUrl+'/share/contribute';
}
