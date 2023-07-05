import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/profile/profile_visitor_view.dart';

class BlockingMemberView extends StatefulWidget {
  const BlockingMemberView({Key? key}) : super(key: key);

  @override
  State<BlockingMemberView> createState() => _BlockingMemberView();
}

class _BlockingMemberView extends State<BlockingMemberView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "차단 멤버 관리",
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
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Profile clicked");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileVisitorView();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/female.jpg'),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '이구역의 미친년',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '2023.07.02',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
                      '해제',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
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
                  GestureDetector(
                    onTap: () {
                      print("Profile clicked");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileVisitorView();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/female.jpg'),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '이구역의 미친년',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '2023.07.02',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
                      '해제',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 5,
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
