import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/guest/payment_method_view.dart';

class PaymentSummaryView extends StatefulWidget {
  const PaymentSummaryView({Key? key}) : super(key: key);

  @override
  State<PaymentSummaryView> createState() => _PaymentSummaryView();
}

class _PaymentSummaryView extends State<PaymentSummaryView> {
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
            Text('모임 정보',
                style: TextStyle(
                  color: Colors.black,
                )),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      'assets/images/landing_page.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '[금요미식회] 금요일 밤, \n싱가포르 클라키 맛집에서 한잔 어때요?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12,
                          ),
                          SizedBox(height: 5, width: 5),
                          Text(
                            "클라키역",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5, width: 15),
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 12,
                          ),
                          SizedBox(height: 5, width: 5),
                          Text(
                            "07/14(월) 오후 08:00",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 40,
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      Text(
                        "결제 금액",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    "15,000원",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Divider(
              height: 40,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '참가비 정보',
                        style: TextStyle(
                          fontSize: 12,
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
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  Text(
                    '참가비 환불 규정 안내',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '  - 결제 후 30분 경과전 : 전액 환불\n  - 모임전 3일전까지 : 전액 환불',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Row(
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
                  '결제 내용과 환불 규정을 확인하였으며, 이에 동의합니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 170,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentMethodView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
