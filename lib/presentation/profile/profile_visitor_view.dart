import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:value_up/core/resource/component/profile_circular_avatar.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/chat/chat_room_view.dart';
import 'package:value_up/presentation/home/small_group_detail_view.dart';
import 'package:value_up/presentation/hosting/hosting_main_view.dart';
import 'package:value_up/presentation/chat/chat_room_list_view.dart';

class ProfileVisitorView extends StatefulWidget {
  const ProfileVisitorView({Key? key}) : super(key: key);

  @override
  State<ProfileVisitorView> createState() => _ProfileVisitorViewState();
}

class _ProfileVisitorViewState extends State<ProfileVisitorView> {
  int _currentBottomIndex = 4;
  int _currentListIndex = 0;

  final String _nickName = "나는 남자다";
  final String _introduction = "저는 남자입니다. 안녕하세요 반갑습니다.";

  TabBar get _tabBar => TabBar(
        tabs: const [
          Tab(icon: Icon(Icons.flight)),
          Tab(icon: Icon(Icons.directions_transit)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Palette.valueBackgroundBlue,
        appBar: getAppbarWidget(),
        bottomNavigationBar: getBottomNavBar(),
        body: getBodyWidget(),
      ),
    );
  }

  PreferredSizeWidget getAppbarWidget() {
    return AppBar(
      centerTitle: true,
      title: Text(
        _nickName,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        color: Colors.black,
        icon: Icon(Icons.arrow_back_ios),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.send,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChatRoomView();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          onPressed: () {
            showReportBottomSheet();
          },
        ),
      ],
    );
  }

  Widget getBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentBottomIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 0,
      onTap: (int newIndex) {
        setState(() {
          _currentBottomIndex = newIndex;
          print("Profile clicked $_currentBottomIndex");
          switch (_currentBottomIndex) {
            case 0:
              {
                Navigator.pop(context);
              }
            case 1:
              {
                Navigator.pop(context);
              }
              break;
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HostingMainView();
                    },
                  ),
                );
              }
              break;
            case 3:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatRoomListView();
                    },
                  ),
                );
              }
              break;
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          label: 'search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_outlined,
            color: Colors.black,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget getBodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: ProfileCircleAvatar(radius: 100),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 110,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "20",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "게시글",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "210",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "팔로워",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "100",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "팔로잉",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "37.8",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "매너온도",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        fixedSize: Size(150, 30),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Palette.valueRed),
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                _nickName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                _introduction,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.white,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  dividerColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                    insets: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Feed',
                    ),
                    Tab(
                      text: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              // first tab bar view widget
              Container(
                color: Colors.white,
                child: Center(
                  child: getMeetingList(),
                ),
              ),
              // second tab bar view widget
              Container(
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: getProfileDetail(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getProfileDetail() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '프로필',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundRectangleButton('나이', 50, 20),
              getRoundRectangleButton('성별', 50, 20),
              getRoundRectangleButton('생일', 50, 20),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '인증내역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundRectangleButton('직장', 50, 20),
              getRoundRectangleButton('학력', 50, 20),
              getRoundRectangleButton('결혼유무', 70, 20),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '관심분야',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundRectangleButton('문화예술', 70, 20),
              getRoundRectangleButton('액티비티', 70, 20),
              getRoundRectangleButton('자기개발', 70, 20),
              getRoundRectangleButton('친목', 50, 20),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getRoundRectangleButton('맛집투어', 70, 20),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '가능언어',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundRectangleButton('한국어', 60, 20),
              getRoundRectangleButton('영어', 50, 20),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget getRoundRectangleButton(
      String textTitle, double width, double height) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white),
      child: Text(
        textTitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget getMeetingList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15),
      physics: ClampingScrollPhysics(),
      // bounce 효과를 제거 할 수 있다.
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.1),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentListIndex = index;
              print(_currentListIndex);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SmallGroupDetailView();
                  },
                ),
              );
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(
                    'assets/image/landing_page.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, top: 2),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(500),
                              ),
                              child: Text(
                                '맥주한잔',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Icon(Icons.location_on_outlined),
                            Text(
                              'Clarke Quay Stn.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.female_outlined),
                            SizedBox(height: 5, width: 5),
                            Text(
                              "2/3",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5, width: 5),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.male_outlined),
                            SizedBox(height: 5, width: 5),
                            Text(
                              "2/3",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5, width: 5),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/landing_page.png'),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(
                                height: 20,
                                width: 22,
                                //color: Colors.white,
                                child: Icon(Icons.star_border, size: 15.0),
                              ),
                              SizedBox(width: 3),
                              Text("likes"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> showReportBottomSheet()
  {
    return showAdaptiveActionSheet(
      context: context,
      title: const Text('사용자 프로필 메뉴'),
      androidBorderRadius: 20,
      actions: <BottomSheetAction>[
        BottomSheetAction(title: const Text('신고하기'), onPressed: (context) {}),
        BottomSheetAction(title: const Text('차단하기'), onPressed: (context) {}),
      ],
      cancelAction: CancelAction(title: const Text('Cancel')),// onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}
