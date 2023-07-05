import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/home/home_view.dart';
import 'package:value_up/presentation/profile/profile_basic_info_view.dart';

class ProfileAlertDialog extends StatefulWidget {
  ProfileAlertDialog({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  State<ProfileAlertDialog> createState() => _ProfileAlertDialogState();
}

class _ProfileAlertDialogState extends State<ProfileAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future showProfileAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Wrap(
          children: [
            Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Image.asset('assets/images/welcome.png')),
              ],
            ),
          ],
        ),
        content:
            Text("인생의 가치를 더하는 여행, \n우리 모두 같이 즐기는여행, \n가치가에 가입하신 것을 환영합니다!"),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        actions: <Widget>[
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(300, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.valueRed),
                  child: const Text('좋은 사람 추천을 위한 프로필 완성하기!'),
                  onPressed: () {
                    setState(() {
                      HomeView.isProfileDone = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileEdit();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
