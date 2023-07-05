import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/hosting/hosting_preview_view.dart';

class HostingIntroView extends StatefulWidget {
  const HostingIntroView({Key? key}) : super(key: key);

  @override
  State<HostingIntroView> createState() => _HostingIntroView();
}

class _HostingIntroView extends State<HostingIntroView> {
  final _meetingIntroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("새로운 모임을 주최합니다",
            style: TextStyle(
              color: Colors.black,
            ),),
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
        StepProgressIndicator(
          totalSteps: 4,
          currentStep: 4,
          selectedColor: Colors.red,
          unselectedColor: Colors.blueAccent,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: const [
              Text(
                '모임에 대해 소개해 보세요!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  print("clicked");
                },
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          '0 / 10',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '소개를 자세히 작성하면, 참석률과 \n신청률이 70% 높아 집니다.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '소개글을 작성해 주세요!',
              hintText: '[스케줄], [계획] 등 소개글을 작성해 주세요!',
            ),
            maxLines: 20,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: Size(150, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Palette.valueRed),
          child: const Text(
            '미리보기',
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
                   return HostingPreviewView();
                 },
               ),
             );
          },
        ),
      ],
    );
  }
}
