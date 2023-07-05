import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/profile/profile_interests_view.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

enum UserSex { male, female }

class _ProfileEditState extends State<ProfileEdit> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _company = TextEditingController();
  final _jobPosition = TextEditingController();

  UserSex? _sex = UserSex.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("기본정보", style: TextStyle(color: Colors.black)),
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
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //배경
          Positioned(
            top: MediaQuery.of(context).size.height / 11,
            right: 0,
            left: 0,
            child: Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 3,
                  currentStep: 1,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.blueAccent,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('이름*',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextField(
                        controller: _firstNameController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('성*',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextField(
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('성별',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text("남성"),
                        value: UserSex.male,
                        groupValue: _sex,
                        onChanged: (UserSex? value) {
                          setState(
                            () {
                              _sex = value;
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text("여성"),
                        value: UserSex.female,
                        groupValue: _sex,
                        onChanged: (UserSex? value) {
                          setState(
                            () {
                              _sex = value;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Text('생년월일을 입력해 주세요',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                Text('또래와 함께하는 맞춤형 모임을 추천해 드려요.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    )),
                Container(
                  height: 120,
                  margin: EdgeInsets.all(10),
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime(1986, 10, 24),
                    maximumDate: DateTime.now(),
                    minimumYear: 1900,
                    maximumYear: 2023,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime value) {},
                  ),
                ),
                Text('신분을 증명하기 위한\n얼굴, 전신, 자유 포즈 사진을 입력 받습니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 160,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text('얼굴',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 140,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/add_profile.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text('전신',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 140,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/add_profile.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text('자유포즈',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 140,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/add_profile.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text('직장(선택)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: _company,
                        ),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 20,
                      child: Text('직무(선택)',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: _jobPosition,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileInterest();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
