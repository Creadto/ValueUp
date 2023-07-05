import 'package:flutter/material.dart';
import 'package:value_up/presentation/profile/profile_visitor_view.dart';
import 'package:value_up/core/resource/palette.dart';

class ProfileCircleAvatar extends StatefulWidget {
  const ProfileCircleAvatar({
    super.key,
    required this.radius,
  });
  final double radius;

  @override
  State<ProfileCircleAvatar> createState() => _ProfileCircleAvatarState();
}

class _ProfileCircleAvatarState extends State<ProfileCircleAvatar> {
  final AssetImage _image = AssetImage('assets/images/female_2.png');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        width: widget.radius,
        height: widget.radius,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
          ),
          shape: BoxShape.circle,
          color: Palette.valueWhite,
          image: DecorationImage(image: _image, fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
