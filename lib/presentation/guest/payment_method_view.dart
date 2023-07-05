import 'package:flutter/material.dart';
import 'package:value_up/core/resource/custom_icons.dart';
import 'package:value_up/core/resource/palette.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  bool _isCardSelected = false;
  bool _isKakaoSelected = false;
  bool _isMethodSelected = false;
  Color _cardButtonForeColor = Colors.black;
  Color _cardButtonBackColor = Colors.white;
  Color _cardButtonBorderColor = Colors.grey;
  Color _kakaoButtonBackColor = Colors.white;
  Color _kakaoButtonBorderColor = Colors.grey;
  Color _payButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "새로운 모임에 참가합니다",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Column(
      children: [
        Divider(
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        SizedBox(
          width: 320,
          child: Container(
            width: MediaQuery.of(context).size.width / 7 * 6,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '가치가는 티켓',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '비용 내역',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '운영비 - 호스트 수고비\n기타 - 플랫폼 수수료, 맥주 한병',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  height: 40,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text(
                          "결제 금액",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "15,000원",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "결제 수단 선택",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 320,
          child: Row(
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: _cardButtonForeColor,
                    minimumSize: Size(150, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(width: 1, color: _cardButtonBorderColor),
                    backgroundColor: _cardButtonBackColor),
                icon: Icon(Icons.credit_card_outlined),
                label: Text('신용카드'),
                onPressed: () {
                  setState(() {
                    if (_isCardSelected == false) {
                      _isCardSelected = true;
                      _isKakaoSelected = false;
                      _isMethodSelected = true;
                      _cardButtonBackColor = Palette.valueRed;
                      _cardButtonBorderColor = Colors.black;
                      _cardButtonForeColor = Colors.white;
                      _kakaoButtonBackColor = Colors.white;
                      _kakaoButtonBorderColor = Colors.grey;
                      _payButtonColor = Palette.valueRed;
                    }
                  });
                },
              ),
              SizedBox(
                width: 20,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    minimumSize: Size(150, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(width: 1, color: _kakaoButtonBorderColor),
                    backgroundColor: _kakaoButtonBackColor),
                icon: Icon(CustomIcon.kakaotalk),
                label: Text('카카오페이'),
                onPressed: () {
                  setState(() {
                    if (_isKakaoSelected == false) {
                      _isKakaoSelected = true;
                      _isCardSelected = false;
                      _isMethodSelected = true;
                      _kakaoButtonBackColor = Palette.kakaoYellow;
                      _kakaoButtonBorderColor = Colors.black;
                      _cardButtonBackColor = Colors.white;
                      _cardButtonBorderColor = Colors.grey;
                      _cardButtonForeColor = Colors.black;
                      _payButtonColor = Palette.valueRed;
                    }
                  });
                },
              ),
            ],
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
              backgroundColor: _payButtonColor),
          child: const Text('결제하기'),
          onPressed: () {
            if (_isMethodSelected) {
            } else {}
          },
        ),
      ],
    );
  }
}
