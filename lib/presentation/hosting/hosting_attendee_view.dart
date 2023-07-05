import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'hosting_cost_view.dart';

class HostingAttendeeView extends StatefulWidget {
  const HostingAttendeeView({Key? key}) : super(key: key);

  @override
  State<HostingAttendeeView> createState() => _HostingAttendeeView();
}

class _HostingAttendeeView extends State<HostingAttendeeView> {
  final _textHostQuestion = TextEditingController();

  bool _isGenderSelected = false;
  bool _isAnyone = true;
  bool _isSameRate = false;
  bool _isMaleOnly = false;
  bool _isFemaleOnly = false;
  bool _isOoA = true;
  bool _isApproval = true;
  bool _anyAge = true;
  Color _anyoneBackColor = Palette.valueRed;
  Color _sameRateBackColor = Colors.grey;
  Color _maleOnlyBackColor = Colors.grey;
  Color _femaleOnlyBackColor = Colors.grey;
  Color _ooABackColor = Palette.valueRed;
  Color _approvalBackColor = Colors.grey;

  int _numAttendees = 2;
  SfRangeValues _ageRange = SfRangeValues(20.0, 60.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("새로운 모임을 주최합니다",
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
      children: [
        StepProgressIndicator(
          totalSteps: 4,
          currentStep: 2,
          selectedColor: Colors.red,
          unselectedColor: Colors.blueAccent,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: const [
              Text(
                '어떤 멤버를모집할까요?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.male),
              Icon(Icons.female),
              Text(
                '(성벌선택)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: Colors.white),
                    backgroundColor: _anyoneBackColor),
                child: Text('누구나'),
                onPressed: () {
                  setState(() {
                    _isGenderSelected = true;
                    _isAnyone = true;
                    _isSameRate = false;
                    _isMaleOnly = false;
                    _isFemaleOnly = false;
                    _anyoneBackColor = Palette.valueRed;
                    _sameRateBackColor = Colors.grey;
                    _maleOnlyBackColor = Colors.grey;
                    _femaleOnlyBackColor = Colors.grey;
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: Colors.white),
                    backgroundColor: _sameRateBackColor),
                child: Text('동일성비'),
                onPressed: () {
                  setState(() {
                    _numAttendees = 2;
                    _isGenderSelected = true;
                    _isSameRate = true;
                    _isAnyone = false;
                    _isMaleOnly = false;
                    _isFemaleOnly = false;
                    _sameRateBackColor = Palette.valueRed;
                    _anyoneBackColor = Colors.grey;
                    _maleOnlyBackColor = Colors.grey;
                    _femaleOnlyBackColor = Colors.grey;
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: Colors.white),
                    backgroundColor: _maleOnlyBackColor),
                child: Text('남자만'),
                onPressed: () {
                  setState(() {
                    _isGenderSelected = true;
                    _isMaleOnly = true;
                    _isAnyone = false;
                    _isSameRate = false;
                    _isFemaleOnly = false;
                    _maleOnlyBackColor = Palette.valueRed;
                    _anyoneBackColor = Colors.grey;
                    _sameRateBackColor = Colors.grey;
                    _femaleOnlyBackColor = Colors.grey;
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: Colors.white),
                    backgroundColor: _femaleOnlyBackColor),
                child: Text('여자만'),
                onPressed: () {
                  setState(() {
                    _isGenderSelected = true;
                    _isFemaleOnly = true;
                    _isAnyone = false;
                    _isSameRate = false;
                    _isMaleOnly = false;
                    _femaleOnlyBackColor = Palette.valueRed;
                    _anyoneBackColor = Colors.grey;
                    _sameRateBackColor = Colors.grey;
                    _maleOnlyBackColor = Colors.grey;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(
          height: 40,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        Text(
          '몇 명과 함께 할까요?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size(80, 20),
                  side: BorderSide(width: 1, color: Colors.white),
                  shape: CircleBorder(),
                  backgroundColor: Colors.blue),
              child: Icon(
                Icons.remove,
                size: 16,
              ),
              onPressed: () {
                setState(() {
                  if (_isSameRate && _numAttendees > 2) {
                    _numAttendees -= 2;
                  } else if (_numAttendees >= 3) {
                    _numAttendees--;
                  }
                });
              },
            ),
            Text(
              '$_numAttendees',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size(80, 20),
                  side: BorderSide(width: 1, color: Colors.white),
                  shape: CircleBorder(),
                  backgroundColor: Palette.valueRed),
              child: Icon(
                Icons.add,
                size: 16,
              ),
              onPressed: () {
                setState(() {
                  if (_isSameRate) {
                    _numAttendees += 2;
                  } else {
                    _numAttendees++;
                  }
                });
              },
            ),
          ],
        ),
        Divider(
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '멤버들의 연령대를 선택하세요.  누구나',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Checkbox(
              value: _anyAge,
              onChanged: (value) {
                setState(() {
                  _anyAge = value!;
                  if (_anyAge) {
                    _ageRange = SfRangeValues(20, 60);
                  }
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              checkColor: Colors.white,
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ],
        ),
        SfRangeSlider(
          values: _ageRange,
          min: 20.0,
          max: 60.0,
          stepSize: 1,
          interval: 10,
          activeColor: Palette.valueRed,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          enableIntervalSelection: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues values) {
            setState(() {
              if (_anyAge) {
                _ageRange = SfRangeValues(20, 60);
              } else {
                _ageRange = values;
              }
            });
          },
        ),
        Divider(
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        Text(
          '어떻게 멤버를 모집할까요?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: _ooABackColor),
                    backgroundColor: _ooABackColor),
                child: Text(
                  '선착순',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isOoA = true;
                    _isApproval = false;
                    _ooABackColor = Palette.valueRed;
                    _approvalBackColor = Colors.grey;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '신청과 동시에 참여가 완료돼요.\n누구나 참여할 수 있어요',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: _approvalBackColor),
                    backgroundColor: _approvalBackColor),
                child: Text(
                  '승인제',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isApproval = true;
                    _isOoA = false;
                    _approvalBackColor = Palette.valueRed;
                    _ooABackColor = Colors.grey;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '호스트가 직접 멤버를 수락하거나 거절할 수 있어요.\n호스트 질문을 통해 취향을 선택하세요.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 320,
          child: TextFormField(
          enabled: _isApproval,
            controller: _textHostQuestion,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '질문을 입력하세요.',
              hintText: '질문을 입력하세요.',
            ),
            maxLines: 3,
          ),
        ),
        Divider(
          height: 40,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: Size(150, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Palette.valueRed),
          child: const Text(
            '다음으로',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HostingCostView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
