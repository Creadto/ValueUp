import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/guest/payment_summary_view.dart';

class MeetingRuleView extends StatefulWidget {
  const MeetingRuleView({Key? key}) : super(key: key);

  @override
  State<MeetingRuleView> createState() => _MeetingRuleView();
}

class _MeetingRuleView extends State<MeetingRuleView> {
  bool _isAgreed = false;
  Color _buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("새로운 모임에 참가합니다",
            style: TextStyle(
              color: Colors.black,
            )),
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
      extendBodyBehindAppBar: false,
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.new_releases_outlined,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            Text('모두가 즐거운 모임이 될 수 있도록 함께 지켜주세요!',
                style: TextStyle(
                  color: Colors.black,
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              child:
                  Text('1. 모임 시작 전 부딕이하게 참여가 어려워진 경우,\n    반드시 호스트에게 미리알려주세요.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              child: Text('2. 모임중에 나와 다른 의견에도 귀 기울이며,\n    함께하는 멤버들을 존중해 주세요.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              child: Container(
                width: MediaQuery.of(context).size.width / 7 * 6,
                height: 160,
                decoration: BoxDecoration(
                  color: Color(0xffffd5d4),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '무단으로 불참하거나, 함께하는 멤버들을\n존중하지 않고 피해를 주는 경우,\n신고 제도를 통해 가치가 이용에 제대를 받습니다.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      height: 25,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isAgreed,
                            onChanged: (value) {
                              setState(() {
                                if (_isAgreed == false) {
                                  _isAgreed = value!;
                                  _buttonColor = Palette.valueRed;
                                } else {
                                  _isAgreed = value!;
                                  _buttonColor = Colors.grey;
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          Text(
                            '모임 이용 규칙을 지키겠습니다! (필수동의)',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7 * 2,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: Size(250, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: _buttonColor),
              child: const Text('다음으로'),
              onPressed: () {
                if (_isAgreed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PaymentSummaryView();
                      },
                    ),
                  );
                } else {
                  null;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
