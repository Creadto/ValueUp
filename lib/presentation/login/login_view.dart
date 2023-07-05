import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/core/resource/custom_icons.dart';
import 'package:value_up/presentation/passportauth/passport_auth_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      body: getBodyWidget(),
    );
  }

  /// login view UI setup
  /// login & sign up widget
  Widget getBodyWidget()  {
    return Stack(
      children: [
        // background image setting
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/landing_page.png'), fit: BoxFit.fill),
            ),
          ),
        ),
        /// login with KAKAO & google BUTTON UI
        Positioned(
          top: MediaQuery.of(context).size.height/3*2,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Text('Login with'),
              SizedBox(
                height: 10,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black, minimumSize: Size(250, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Palette.kakaoYellow
                ),
                icon: Icon(CustomIcon.kakaotalk),
                label: Text(' Kakao로 시작하기'),
                onPressed: (){
                  //loginWithKakao();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PassportAuthView();
                      },
                    ),
                  );
                },
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, minimumSize: Size(250, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Palette.valueRed
                ),
                icon: Icon(CustomIcon.gplus),
                label: Text('  Google로 시작하기'),
                onPressed: (){

                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
