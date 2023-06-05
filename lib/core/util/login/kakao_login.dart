import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:value_up/core/util/login/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print("login 성공");
          return true;
        } catch (e) {
          print("login 실패(1)");
          print(e);
          return false;
        }
      }
    } catch (e) {
      print("login 실패2");
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
