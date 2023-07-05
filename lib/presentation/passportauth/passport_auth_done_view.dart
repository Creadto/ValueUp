import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/home/home_view.dart';

class PassportAuthDoneView extends StatefulWidget {
  const PassportAuthDoneView({Key? key}) : super(key: key);

  @override
  State<PassportAuthDoneView> createState() => _PassportAuthDoneView();
}

class _PassportAuthDoneView extends State<PassportAuthDoneView> {
  bool _isService = false;
  bool _isPerInfo = false;
  bool _isCommunity = false;
  bool _isAdult = false;
  bool _isCommercial = false;
  bool _isAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "여권 인증 완료",
          style: TextStyle(
            color: Palette.valueBlack,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          color: Palette.valueBlack,
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
            Text('여권만 인증하면 가입완료',
                style: TextStyle(
                  color: Palette.valueRed,
                )),
            Text('여권을 인증해 주세요.',
                style: TextStyle(
                  fontSize: 20,
                  color: Palette.valueBlack,
                )),
            Text('신뢰할 수 있는 모임을 위해 여권 인증이 필요해요.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 6 * 5,
              height: 100,
              child: TextFormField(
                enableInteractiveSelection: false,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  hintText: '여권 인증이 완료 되었습니다.',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 7 * 4,
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
                showAgreeBottomSheet();
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<void> showAgreeBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
      ),
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setBottomState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: Container()),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Palette.valueBlack,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    '  가치가를 시작하기 위해 약관을 동의해 주세요.',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Palette.valueBlack,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isService,
                      onChanged: (value) {
                        setBottomState(() {
                          _isService = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '서비스 이욕약관 동의 (필수)',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isPerInfo,
                      onChanged: (value) {
                        setBottomState(() {
                          _isPerInfo = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '개인정보 수집 및 이용 동의 (필수)',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isCommunity,
                      onChanged: (value) {
                        setBottomState(() {
                          _isCommunity = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '모임 가이드 동의 (필수)',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isAdult,
                      onChanged: (value) {
                        setBottomState(() {
                          _isAdult = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '만 19세 이상(필수)',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isCommercial,
                      onChanged: (value) {
                        setBottomState(() {
                          _isCommercial = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '혜택 및 이벤트 알림 수신 동의(선택)',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                color: Colors.grey[300],
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isAll,
                      onChanged: (value) {
                        setBottomState(() {
                          _isService = value!;
                          _isPerInfo = value;
                          _isCommunity = value;
                          _isAdult = value;
                          _isCommercial = value;
                          _isAll = value;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      checkColor: Colors.white,
                      activeColor: Palette.valueRed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    Text(
                      '전체 동의 합니다.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Palette.valueBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Palette.valueRed),
                    child: const Text('다음으로'),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeView.routeName, (route) => false,
                          arguments: {"update": true});
                    },
                  )
                ],
              ),
            ],
          );
        });
      },
    );
  }
}
