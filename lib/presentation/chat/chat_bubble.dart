import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage,
      {Key? key})
      : super(key: key);

  final String message;
  final String userName;
  final bool isMe;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Profile clicked");
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/female.jpg'),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
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
          if (isMe)
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
      Positioned(
        top: 0,
        right: isMe ? 5 : null,
        left: isMe ? null : 5,
        child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        ),
      ),
    ]);
  }
}
