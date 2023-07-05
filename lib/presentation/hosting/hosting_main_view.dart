import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/hosting/hosting_attendee_view.dart';

class HostingMainView extends StatefulWidget {
  const HostingMainView({Key? key}) : super(key: key);

  @override
  State<HostingMainView> createState() => _HostingFirstView();
}

class _HostingFirstView extends State<HostingMainView> {
  final _meetingNameController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: getAppbarWidget(),
      extendBodyBehindAppBar: false,
      body: getBodyWidget(),
    );
  }
  PreferredSizeWidget getAppbarWidget() {
    return AppBar(
      centerTitle: true,
      title: Text("새로운 모임을 주최합니다",
          style: TextStyle(
            color: Colors.black,
          )),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
  Widget getBodyWidget() {
    return Column(
      children: [
        StepProgressIndicator(
          totalSteps: 4,
          currentStep: 1,
          selectedColor: Colors.red,
          unselectedColor: Colors.blueAccent,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '모임의 이름을 작성하세요.(40자 이내)',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 40,
          width: 350,
          child: TextField(
            controller: _meetingNameController,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            expands: false,
          ),
        ),
        Divider(
          height: 60,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        Text(
          '어디서 만날까요?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Text(
                '온라인',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Switch(
              value: _isOnline,
              activeColor: Palette.valueRed,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.lightBlueAccent,
              onChanged: (value) {
                setState(() {
                  _isOnline = value;
                });
              },
            ),
            Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Text(
                '오프라인',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 150,
              child: TextField(
                controller: _locationController,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size(100, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(width: 1, color: Colors.white),
                  backgroundColor: Palette.valueRed),
              icon: Icon(
                Icons.location_on_outlined,
                size: 16,
              ),
              label: Text('장소선택'),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        Divider(
          height: 60,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        Text(
          '언제 만날까요?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 150,
              child: TextField(
                controller: _locationController,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size(100, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(width: 1, color: Colors.white),
                  backgroundColor: Palette.valueRed),
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 16,
              ),
              label: Text('시간선택'),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        Divider(
          height: 60,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 7 * 1,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: Size(150, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Palette.valueRed),
          child: const Text(
            '다음으로',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HostingAttendeeView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
