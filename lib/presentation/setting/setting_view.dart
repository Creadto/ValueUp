import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/setting/account_management_view.dart';
import 'package:value_up/presentation/setting/alliance_service_view.dart';
import 'package:value_up/presentation/setting/blocking_member_view.dart';
import 'package:value_up/presentation/setting/customer_service_view.dart';
import 'package:value_up/presentation/setting/faq_list_view.dart';
import 'package:value_up/presentation/setting/invite_code_view.dart';
import 'package:value_up/presentation/setting/notice_list_view.dart';
import 'package:value_up/presentation/setting/notification_settings_view.dart';
import 'package:value_up/presentation/setting/privacy_policy_view.dart';
import 'package:value_up/presentation/setting/service_term_view.dart';
import 'package:value_up/presentation/setting/software_version_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingView();
}

class _SettingView extends State<SettingView> {
  int _currentListIndex = 0;
  final List<String> _settingItems = <String>[
    '공지사항',
    '자주 하는 질문',
    '고객센터',
    '제휴문의',
    '친구초대 & 초대코드',
    '알림설정',
    '차단멤버관리',
    '계정관리',
    '서비스 이용약관',
    '개인정보 처리방침',
    '소프트웨어 버전',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("설    정",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
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
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: _settingItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentListIndex = index;
                    print(_currentListIndex);
                    switch (_currentListIndex) {
                      case 0:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NoticeListView();
                              },
                            ),
                          );
                        }
                        break;
                      case 1:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FAQListView();
                              },
                            ),
                          );
                        }
                        break;
                      case 2:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CustomerServiceView();
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
                                return AllianceServiceView();
                              },
                            ),
                          );
                        }
                        break;
                      case 4:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InviteCodeView();
                              },
                            ),
                          );
                        }
                        break;
                      case 5:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NotificationSettingView();
                              },
                            ),
                          );
                        }
                        break;
                      case 6:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BlockingMemberView();
                              },
                            ),
                          );
                        }
                        break;
                      case 7:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AccountManagementView();
                              },
                            ),
                          );
                        }
                        break;
                      case 8:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ServiceTermView();
                              },
                            ),
                          );
                        }
                        break;
                      case 9:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PrivacyPolicyView();
                              },
                            ),
                          );
                        }
                        break;
                      case 10:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SoftwareVersionView();
                              },
                            ),
                          );
                        }
                        break;
                    }
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(_settingItems[index]),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
