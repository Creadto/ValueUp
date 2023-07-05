import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/core/resource/component/single_toggle_button.dart';
import 'package:value_up/presentation/profile/profile_photo_view.dart';

class ProfileInterest extends StatefulWidget {
  const ProfileInterest({Key? key}) : super(key: key);

  @override
  State<ProfileInterest> createState() => _ProfileInterestState();
}

class _ProfileInterestState extends State<ProfileInterest> {
  final SingleToggleButton _cultureButton = SingleToggleButton(
    initBackColor: Colors.white,
    initBorderColor: Colors.black,
    changedBackColor: Palette.valueRed,
    changedBorderColor: Colors.white,
    text: '문화예술',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.valueBackgroundBlue,
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("여행 중 관심사를 선택해 주세요.", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            StepProgressIndicator(
              totalSteps: 3,
              currentStep: 2,
              selectedColor: Colors.red,
              unselectedColor: Colors.blueAccent,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: _cultureButton,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("박물관 미술관 뮤지컬 연극 연주회 콘서트 전시 공연 등.",
                  style: TextStyle(color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: SingleToggleButton(
                initBackColor: Colors.white,
                initBorderColor: Colors.black,
                changedBackColor: Palette.valueRed,
                changedBorderColor: Colors.white,
                text: '액티비티',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                  "테마파크 클라이밍 테니스 배드민턴 등산 자전거\n농주 축구 야구 볼링 골프 서핑 스키 스노우보드 테니스",
                  style: TextStyle(color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: SingleToggleButton(
                initBackColor: Colors.white,
                initBorderColor: Colors.black,
                changedBackColor: Palette.valueRed,
                changedBorderColor: Colors.white,
                text: '맛집투어',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("파인다이닝 요리 카페 디저트 와인 칵테일 위스키 맥주 등.",
                  style: TextStyle(color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: SingleToggleButton(
                initBackColor: Colors.white,
                initBorderColor: Colors.black,
                changedBackColor: Palette.valueRed,
                changedBorderColor: Colors.white,
                text: '자기개발',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("외국어 재테크 스터디 창업 사이드프로젝트 등.",
                  style: TextStyle(color: Colors.black)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: SingleToggleButton(
                initBackColor: Colors.white,
                initBorderColor: Colors.black,
                changedBackColor: Palette.valueRed,
                changedBorderColor: Colors.white,
                text: '친  목',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text("지역사회 또래 맥주한잔 산책 소개팅 파티 등.",
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 120,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: Size(250, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Palette.valueRed),
              child: const Text('다음으로'),
              onPressed: () {
                _cultureButton.isSelected;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePhoto();
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
