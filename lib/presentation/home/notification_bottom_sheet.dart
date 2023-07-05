import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';

class NotificationBottomSheet {
  NotificationBottomSheet({
    required this.context,
  }) {
    showAlertBottomSheet(context);
  }

  final BuildContext context;
  final TextEditingController searchTextController = TextEditingController();
  bool _isAlertOn = true;

  Future<void> showAlertBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter bottomState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                    ),
                    Expanded(
                      child: Text(
                        '알림',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          '전체 알림 On/Off',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Switch(
                        value: _isAlertOn,
                        activeColor: Palette.valueRed,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.black12,
                        onChanged: (value) {
                          bottomState(() {
                            _isAlertOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("clicked");
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/female.jpg'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9 - 80,
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              child: getRoundRectangleButton('친목', 50, 20),
                            ),
                            Text(
                              '저 여자 분이 친구로 추가하셨습니다.',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  '2 시간전',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("clicked");
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/landing_page.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9 - 80,
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              child: getRoundRectangleButton('모임', 50, 20),
                            ),
                            Text(
                              '모임의 참가가 수락되었습니다.',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  '4 시간전',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  Widget getRoundRectangleButton(
      String textTitle, double width, double height) {
    return TextButton(
      style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          foregroundColor: Colors.black,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white24),
      child: Text(
        textTitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      onPressed: () {},
    );
  }
}
