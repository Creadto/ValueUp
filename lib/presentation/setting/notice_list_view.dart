import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/setting/notice_detail_view.dart';

class NoticeListView extends StatefulWidget {
  const NoticeListView({Key? key}) : super(key: key);

  @override
  State<NoticeListView> createState() => _NoticeListView();
}

class _NoticeListView extends State<NoticeListView> {
  int _currentListIndex = 0;
  final List<String> _noticeItems = <String>[
    '[공지] 이제부터 시작입니다.',
    '[공지] 가기가는 여행 출발합니다.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("공지사항",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NoticeDetailView();
                              },
                            ),
                          );
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
