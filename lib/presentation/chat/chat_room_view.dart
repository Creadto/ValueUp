import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:value_up/core/resource/component/profile_circular_avatar.dart';
import 'package:value_up/core/resource/palette.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  final String _roomName = "방제목이당";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XfFfbe5d6),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_roomName,
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ProfileCircleAvatar(radius: 55),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Text(
                              "싱가여성",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            BubbleSpecialOne(
                              text: '안녕하세요?',
                              isSender: false,
                              color: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              "12:00",
                              style: TextStyle(
                                fontSize: 14,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: 55,
                    height: 55,
                  ),
                  BubbleSpecialOne(
                    text: '반갑습니다',
                    isSender: false,
                    color: Colors.white,
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    "12:01",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "12:02",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  BubbleSpecialOne(
                    text: '안녕하세요!~!',
                    isSender: false,
                    color: Colors.white,
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        MessageBar(
          onSend: (_) => print(_),
          actions: [
            InkWell(
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: InkWell(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.green,
                  size: 24,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
