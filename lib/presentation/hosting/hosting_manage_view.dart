import 'package:flutter/material.dart';
import 'package:value_up/core/resource/component/profile_circular_avatar.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/hosting/hosting_preview_view.dart';
import 'package:value_up/presentation/profile/profile_visitor_view.dart';

class HostingManageView extends StatefulWidget {
  const HostingManageView({Key? key}) : super(key: key);

  @override
  State<HostingManageView> createState() => _HostingManageViewState();
}

class _HostingManageViewState extends State<HostingManageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "소모임을 관리합니다.",
          style: TextStyle(
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
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              ProfileCircleAvatar(radius: 70),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  '-질문의 대한 답-\n너무 기대되요. 만나서 반가워요. 열심히 활동할게요',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text(
                  '수락',
                  style: TextStyle(
                    fontSize: 14,
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
              SizedBox(
                width: 5,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text(
                  '거절',
                  style: TextStyle(
                    fontSize: 14,
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
              SizedBox(
                width: 5,
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
              ProfileCircleAvatar(radius: 70),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  '-질문의 대한 답-\n너무 기대되요. 만나서 반가워요. 열심히 활동할게요',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text(
                  '수락',
                  style: TextStyle(
                    fontSize: 14,
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
              SizedBox(
                width: 5,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text(
                  '거절',
                  style: TextStyle(
                    fontSize: 14,
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
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
