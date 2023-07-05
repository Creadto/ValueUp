import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/chat/chat_room_view.dart';

class ChatRoomListView extends StatefulWidget {
  const ChatRoomListView({Key? key}) : super(key: key);

  @override
  State<ChatRoomListView> createState() => _ChatRoomListViewState();
}

class _ChatRoomListViewState extends State<ChatRoomListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("채팅",
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: false,
      body: getBodyWidget(context),
    );
  }

  Widget getBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < 15; i++) ...[
            GestureDetector(
              onTap: () {
                print("clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatRoomView();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 65,
                    height: 65,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/landing_page.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '크리토(Creadto.com)',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '어제',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '메세지가 도착했습니다',
                              style: TextStyle(
                                fontSize: 12,
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
            SizedBox(
              height: 5,
            )
          ],
        ],
      ),
    );
  }
}
