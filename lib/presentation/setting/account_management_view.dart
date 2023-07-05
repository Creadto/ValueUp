import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';


class AccountManagementView extends StatefulWidget {
  const AccountManagementView({Key? key}) : super(key: key);

  @override
  State<AccountManagementView> createState() => _AccountManagementView();
}

class _AccountManagementView extends State<AccountManagementView> {
  int _currentListIndex = 0;
  final List<String> _noticeItems = <String>[
    '로그아웃',
    '회원탈퇴',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("계정관리",
            style: TextStyle(
              fontSize: 20,
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
        Divider(
          height: 10,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.grey,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: _noticeItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentListIndex = index;
                    print(_currentListIndex);

                    switch (_currentListIndex) {
                      case 0:
                        {

                        }
                        break;
                    }
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(_noticeItems[index]),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
