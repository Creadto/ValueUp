import 'package:flutter/material.dart';
import 'package:value_up/core/resource/component/profile_circular_avatar.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/guest/meeting_rule_view.dart';
import 'package:value_up/presentation/hosting/hosting_manage_view.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class SmallGroupDetailView extends StatefulWidget {
  const SmallGroupDetailView({Key? key}) : super(key: key);

  @override
  State<SmallGroupDetailView> createState() => _SmallRoomView();
}

class _SmallRoomView extends State<SmallGroupDetailView> {
  bool isFavorite = false;
  bool isHost = true;
  Widget iconDate = Icon(Icons.star_border_outlined, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
        backgroundColor: Colors.transparent,
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
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
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
      ),
      //extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  'assets/image/landing_page.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //배경
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black12, // your color here
                        width: 1,
                      ),
                      foregroundColor: Colors.white,
                      minimumSize: Size(80, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.valueRed),
                  child: const Text(
                    '맥주한잔',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {

                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black12, // your color here
                        width: 1,
                      ),
                      foregroundColor: Colors.white,
                      minimumSize: Size(80, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.valueRed),
                  child: const Text(
                    '잔여2석',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {

                  },
                ),
                if (isHost) ...[
                  TextButton(
                    style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black12, // your color here
                          width: 1,
                        ),
                        foregroundColor: Colors.white,
                        minimumSize: Size(80, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Palette.valueRed),
                    child: const Text(
                      '관리하기',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HostingManageView();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' 1/3 ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: iconDate,
                  onPressed: () {
                    setState(() {
                      if (isFavorite) {
                        isFavorite = false;
                        iconDate = Icon(Icons.star_border_outlined,
                            color: Colors.white);
                      } else {
                        isFavorite = true;
                        iconDate = Icon(Icons.star, color: Colors.red);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width / 7 * 6,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      '싱가여자',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        '[금요미식회] 금요일 밤, 싱가포르 클라키 맛집에서 한잔 어때요?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: ProfileCircleAvatar(radius: 90,),
          ),
          Positioned(
            top: 350,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: SizedBox(
                width: 280,
                child: Column(
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(height: 5, width: 5),
                        Text(
                          "클라키역",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 5, width: 40),
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(height: 5, width: 5),
                        Text(
                          "07/14(월) 오후 08:00",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 280,
                      child: Row(
                        children: [
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 280,
                      child: Row(
                        children: [
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 280,
                      child: Text(
                        '안내사항',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 290,
                      child: Row(
                        children: [
                          Icon(Icons.attach_money_outlined),
                          SizedBox(height: 5, width: 5),
                          Text(
                            "15,000원",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 290,
                      child: Row(
                        children: [
                          Icon(Icons.info_outline_rounded),
                          SizedBox(height: 5, width: 5),
                          Text(
                            "노쇼 방지비, 개인당 맥주 한병과 안주 비용",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280,
                      child: Text(
                        '[ 스케줄 ]\n  08:00~   모임, 바에서 맥주한잔\n  10:00~   자율적으로 활동',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text('참여하기'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MeetingRuleView();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> showReportBottomSheet()
  {
    return showAdaptiveActionSheet(
      context: context,
      title: const Text('소모임 메뉴'),
      androidBorderRadius: 20,
      actions: <BottomSheetAction>[
        BottomSheetAction(title: const Text('신고하기'), onPressed: (context) {}),
      ],
      cancelAction: CancelAction(title: const Text('Cancel')),// onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}
