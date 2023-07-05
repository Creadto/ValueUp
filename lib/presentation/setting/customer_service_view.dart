import 'package:flutter/material.dart';
import 'package:value_up/core/resource/custom_icons.dart';
import 'package:value_up/core/resource/palette.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({Key? key}) : super(key: key);

  @override
  State<CustomerServiceView> createState() => _CustomerServiceView();
}

class _CustomerServiceView extends State<CustomerServiceView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "고객센터",
          style: TextStyle(
            fontSize: 20,
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
      extendBodyBehindAppBar: false,
      body: getBodyWidget(),
      );
  }

  Widget getBodyWidget() {
    return Column(
      children: [
        Divider(
          height: 10,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.grey,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "궁금하거나 불편한 점을 즉시 답변드립니다.\n\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                      "카카오톡 문의\n"
                      "평일 : 08:00~24:00\n"
                      "주말 및 공휴일 : 10:00~19:00\n",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
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
                  label: Text(' Kakao로 문의하기'),
                  onPressed: (){

                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
