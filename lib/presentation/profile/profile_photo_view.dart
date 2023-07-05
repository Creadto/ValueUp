import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/home/home_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

enum UserSex { male, female }

class _ProfilePhotoState extends State<ProfilePhoto> {
  File _image = File('');
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("프로필 사진을 등록해주세요", style: TextStyle(color: Colors.black)),
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
      extendBodyBehindAppBar: true,
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Stack(
      children: [
        //배경
        Positioned(
          top: MediaQuery.of(context).size.height / 11,
          right: 0,
          left: 0,
          child: Column(
            children: [
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: 3,
                selectedColor: Colors.red,
                unselectedColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 25,
              ),
              Text("본인을 대표하는 사진을 등록해 주세요.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  )),
              SizedBox(
                height: 25,
              ),
              RawMaterialButton(
                elevation: 0.5,
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(
                    side: BorderSide(width: 1, color: Colors.black)),
                fillColor: Colors.white,
                child: Image(
                    image: AssetImage('assets/images/add_profile.png'),
                    fit: BoxFit.fill),
                onPressed: () {},
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 140,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Image(
                            image: AssetImage('assets/images/add_profile.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: Size(250, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.valueRed),
                child: const Text('다음으로'),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(HomeView.routeName));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image);
    }
  }
}
