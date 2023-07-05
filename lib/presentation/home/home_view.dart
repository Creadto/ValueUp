import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/core/resource/enum_shop.dart';
import 'package:value_up/presentation/home/filter_bottom_sheet.dart';
import 'package:value_up/presentation/home/notification_bottom_sheet.dart';
import 'package:value_up/presentation/home/profile_alert_dialog.dart';
import 'package:value_up/presentation/home/search_bottom_sheet.dart';
import 'package:value_up/presentation/home/small_group_list_view.dart';
import 'package:value_up/presentation/chat/chat_room_list_view.dart';
import 'package:value_up/presentation/profile/profile_personal_view.dart';
import 'package:value_up/presentation/hosting/hosting_main_view.dart';
import 'package:value_up/presentation/setting/setting_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = "/HomeView";
  static bool isProfileDone = false;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentBottomNavIndex = 0;

  List<Widget> body = const [
    Icon(Icons.home_outlined),
    Icon(Icons.search),
    Icon(Icons.add_box_outlined),
    Icon(Icons.chat_outlined),
    Icon(Icons.person_outlined),
  ];

  final List<Widget> _pages = <Widget>[
    SmallGroupListView(),
    Container(), //Dummy container for page index
    HostingMainView(),
    ChatRoomListView(),
    ProfilePersonalView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: getAppbarWidget(),
      body: _currentBottomNavIndex == BottomNavigationIndex.search.index
          ? _pages[BottomNavigationIndex.home.index]
          : _pages[_currentBottomNavIndex],
      bottomNavigationBar: getBottomNavBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    if (HomeView.isProfileDone == false) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => ProfileAlertDialog(context: context));
    }
  }

  PreferredSizeWidget getAppbarWidget() {
    if (_currentBottomNavIndex == BottomNavigationIndex.home.index ||
        _currentBottomNavIndex == BottomNavigationIndex.search.index) {
      return AppBar(
        centerTitle: true,
        title: Text(
          "Value up",
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingView();
                },
              ),
            );
          },
          color: Colors.black,
          icon: Icon(Icons.settings),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.black,
            ),
            onPressed: () {
              FilterBottomSheet(context: context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              NotificationBottomSheet(context: context);
            },
          ),
        ],
      );
    }
    else
      {
        return EmptyAppBar();
      }
  }
  Widget getBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _currentBottomNavIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 0,
        onTap: (int newIndex) {
          setState(() {
            _currentBottomNavIndex = newIndex;
            if (_currentBottomNavIndex == BottomNavigationIndex.search.index) {
              SearchBottomSheet(context: context);
              _currentBottomNavIndex = BottomNavigationIndex.home.index;
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
        ]);
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
