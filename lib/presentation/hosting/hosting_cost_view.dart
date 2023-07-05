import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:intl/intl.dart';
import 'package:value_up/presentation/hosting/hosting_intro_view.dart';

class HostingCostView extends StatefulWidget {
  const HostingCostView({Key? key}) : super(key: key);

  @override
  State<HostingCostView> createState() => _HostingCostView();
}

class _HostingCostView extends State<HostingCostView> {
  final _textCustomFee = TextEditingController();

  bool _isEntryFee = true;
  bool _isContentsFee = false;
  bool _isHostFee = false;
  bool _isRentalFee = false;
  bool _isMaterialFee = false;
  bool _isSnackFee = false;
  bool _isNoShowFee = false;
  bool _isCommission = false;
  bool _isCustomFee = false;

  Color _feeBackColor = Palette.valueRed;
  Color _nonFeeBackColor = Colors.grey;

  int _entryFee = 10000;
  final _feeFormat = NumberFormat.currency(locale: 'ko_KR', symbol: ' ₩ ');

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
          currentStep: 3,
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
              Icon(Icons.attach_money_outlined),
              Text(
                '참가비가 있나요?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    fixedSize: Size(80, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(width: 1, color: Colors.white),
                    backgroundColor: _feeBackColor),
                child: Text('있음'),
                onPressed: () {
                  setState(() {
                    _isEntryFee = true;
                    _feeBackColor = Palette.valueRed;
                    _nonFeeBackColor = Colors.grey;
                    _entryFee = 10000;
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
                    backgroundColor: _nonFeeBackColor),
                child: Text('없음'),
                onPressed: () {
                  setState(() {
                    _isEntryFee = false;
                    _nonFeeBackColor = Palette.valueRed;
                    _feeBackColor = Colors.grey;
                    _entryFee = 0;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: const [
              Icon(Icons.attach_money_outlined),
              Text(
                '참가비',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: Row(
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
                    if (_isEntryFee && _entryFee >= 2000) {
                      _entryFee -= 1000;
                    }
                  });
                },
              ),
              Text(
                _feeFormat.format(_entryFee),
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
                    if (_isEntryFee) {
                      _entryFee += 1000;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: const [
              Icon(Icons.info_outline_rounded),
              Text(
                ' 참가비 정보?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '참가비의 20% = 세금, PG 수수료,\n플랫폼 수수료로 정산됩니다.',
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
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '[운영비]',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: _isContentsFee,
                    onChanged: (value) {
                      setState(() {
                        _isContentsFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '콘텐츠 제작비',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                    value: _isHostFee,
                    onChanged: (value) {
                      setState(() {
                        _isHostFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '호스트 수고비',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                '[모임비]',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: _isRentalFee,
                    onChanged: (value) {
                      setState(() {
                        _isRentalFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '대관료',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                    value: _isMaterialFee,
                    onChanged: (value) {
                      setState(() {
                        _isMaterialFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '재료비',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                    value: _isSnackFee,
                    onChanged: (value) {
                      setState(() {
                        _isSnackFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '다과비',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                '[기  타]',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: _isNoShowFee,
                    onChanged: (value) {
                      setState(() {
                        _isNoShowFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '노쇼 방지비',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                    value: _isCommission,
                    onChanged: (value) {
                      setState(() {
                        _isCommission = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '플랫폼 수수료',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: _isCustomFee,
                    onChanged: (value) {
                      setState(() {
                        _isCustomFee = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    checkColor: Colors.white,
                    activeColor: Colors.red,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  Text(
                    '직접입력 : ',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 200,
                    height: 35,
                    child: TextFormField(
                      controller: _textCustomFee,
                      enabled: _isCustomFee,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '내용을 입력하세요.',
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
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
                  return HostingIntroView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
