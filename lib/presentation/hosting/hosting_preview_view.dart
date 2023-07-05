import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/home/home_view.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HostingPreviewView extends StatefulWidget {
  const HostingPreviewView({Key? key}) : super(key: key);

  @override
  State<HostingPreviewView> createState() => _HostingPreviewView();
}

class _HostingPreviewView extends State<HostingPreviewView> {
  bool isFavorite = false;
  bool isHost = true;
  Widget iconDate = Icon(Icons.star_border_outlined, color: Colors.white);
  final int _totalImageNumber = 3;
  int _currentImageNumber = 1;
  String _imageNumber = '';
  @override
  Widget build(BuildContext context) {
    _imageNumber = '$_currentImageNumber/$_totalImageNumber';
    return Scaffold(
      backgroundColor: Palette.valueBackgroundBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "새로운 모임을 주최합니다",
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
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    print('Page changed: $value');
                    setState(() {
                      _currentImageNumber++;
                      if(_currentImageNumber > _totalImageNumber)
                        {
                          _currentImageNumber = 1;
                        }
                      _imageNumber = '$_currentImageNumber/$_totalImageNumber';
                    });
                  },
                  autoPlayInterval: 3000,

                  isLoop: true,
                  children: [
                    Image.asset(
                      'assets/images/landing_page.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/female.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/female_2.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: StepProgressIndicator(
              totalSteps: 4,
              currentStep: 4,
              selectedColor: Colors.red,
              unselectedColor: Colors.blueAccent,
            ),
          ),
          //배경
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
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
                          borderRadius: BorderRadius.circular(20),
                      ),
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
                    Navigator.pop(context, true);
                  },
                ),
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
                  ' $_imageNumber ',
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
            child: GestureDetector(
              onTap: () {
                print("Profile clicked");
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image/female.jpg'),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
          ),
          Positioned(
            top: 350,
            right: 0,
            left: 0,
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
                            fontWeight: FontWeight.w500),
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
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 280,
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
                    width: 280,
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
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
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
                  child: const Text('게시하기'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
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
}
