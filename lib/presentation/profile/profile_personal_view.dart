import 'package:flutter/material.dart';
import 'package:value_up/core/resource/component/profile_circular_avatar.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/home/small_group_detail_view.dart';

class ProfilePersonalView extends StatefulWidget {
  const ProfilePersonalView({Key? key}) : super(key: key);

  @override
  State<ProfilePersonalView> createState() => _ProfilePersonalViewState();
}

class _ProfilePersonalViewState extends State<ProfilePersonalView> {
  int _currentListIndex = 0;
  bool _isProfileOpen = false;
  bool _isAuthOpen = false;
  bool _isInterestOpen = false;
  bool _isLanguageOpen = false;
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
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
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
            ProfileCircleAvatar(radius: 100),
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
                        foregroundColor: Colors.black,
                        fixedSize: Size(150, 30),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white),
                    child: const Text(
                      '프로필 수정',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
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
                      text: '프로필',
                    ),
                    Tab(
                      text: '모임',
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
                  child: SingleChildScrollView(
                    child: getProfileDetail(),
                  ),
                ),
              ),
              // second tab bar view widget
              Container(
                color: Colors.white,
                child: Center(child: getMeetingList()),
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
            children: [
              Text(
                '프로필',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _isProfileOpen,
                activeColor: Palette.valueRed,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.black12,
                onChanged: (value) {
                  setState(() {
                    _isProfileOpen = value;
                  });
                },
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
            children: [
              Text(
                '인증내역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _isAuthOpen,
                activeColor: Palette.valueRed,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.black12,
                onChanged: (value) {
                  setState(() {
                    _isAuthOpen = value;
                  });
                },
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
            children: [
              Text(
                '관심분야',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _isInterestOpen,
                activeColor: Palette.valueRed,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.black12,
                onChanged: (value) {
                  setState(() {
                    _isInterestOpen = value;
                  });
                },
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
            children: [
              Text(
                '가능언어',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: _isLanguageOpen,
                activeColor: Palette.valueRed,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.black12,
                onChanged: (value) {
                  setState(() {
                    _isLanguageOpen = value;
                  });
                },
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
                    'assets/images/landing_page.png',
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
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
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
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/landing_page.png'),
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
}
