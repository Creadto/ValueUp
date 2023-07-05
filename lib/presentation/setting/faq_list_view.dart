import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/setting/notice_detail_view.dart';

class FAQListView extends StatefulWidget {
  const FAQListView({Key? key}) : super(key: key);

  @override
  State<FAQListView> createState() => _FAQListView();
}

class _FAQListView extends State<FAQListView> {
  int _currentListIndex = 0;
  final List<String> _noticeItems = <String>[
    '[FAQ] 호스팅은 어떻게 하나요?',
    '[FAQ] 참가는 어떻게 하나요?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("자주하는 질문",
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
