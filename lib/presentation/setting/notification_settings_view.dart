import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';

class NotificationSettingView extends StatefulWidget {
  const NotificationSettingView({Key? key}) : super(key: key);

  @override
  State<NotificationSettingView> createState() => _NotificationSettingView();
}

class _NotificationSettingView extends State<NotificationSettingView> {

  bool _isChatOn = true;
  bool _isNewMemberOn = true;
  bool _isMarketingOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "알림설정",
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
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text(
                          '채팅',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '새로운 메시지가 오면 알림',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isChatOn,
                    activeColor: Palette.valueRed,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black12,
                    onChanged: (value) {
                      setState(() {
                        _isChatOn = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text(
                          '새로운 참가인원',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '호스팅 시 새로운 참가자가 생기면 알림',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isNewMemberOn,
                    activeColor: Palette.valueRed,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black12,
                    onChanged: (value) {
                      setState(() {
                        _isNewMemberOn = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text(
                          '마케팅 및 유익한 정보',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '새로운 마케팅 및 유익한 정보 알림',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isMarketingOn,
                    activeColor: Palette.valueRed,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black12,
                    onChanged: (value) {
                      setState(() {
                        _isMarketingOn = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
