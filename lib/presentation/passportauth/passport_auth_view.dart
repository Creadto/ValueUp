import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:value_up/presentation/passportauth//passport_auth_done_view.dart';

class PassportAuthView extends StatefulWidget {
  const PassportAuthView({Key? key}) : super(key: key);

  @override
  State<PassportAuthView> createState() => _PassportAuthView();
}

class _PassportAuthView extends State<PassportAuthView> {
  final _passportNumber = TextEditingController();
  final _sex = TextEditingController();
  final _surname = TextEditingController();
  final _givenName = TextEditingController();
  final _birthDate = TextEditingController();
  final _issueDate = TextEditingController();
  final _expiryDate = TextEditingController();

  File _image = File('');
  final _picker = ImagePicker();

  TabBar get _tabBar => TabBar(
        tabs: const [
          Tab(icon: Icon(Icons.camera)),
          Tab(icon: Icon(Icons.photo_outlined)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Palette.valueBackgroundBlue,
        appBar: getAppbar(),
        extendBodyBehindAppBar: false,
        body: getBodyWidget(),
      ),
    );
  }

  PreferredSizeWidget getAppbar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "여권 인증",
        style: TextStyle(color: Palette.valueBlack, fontSize: 18),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        color: Palette.valueBlack,
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  Widget getBodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '여권만 인증하면 가입완료',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        Text(
          '여권을 인증해 주세요.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Text(
          '신뢰할 수 있는 모임을 위해 여권 인증이 필요해요.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: Colors.lightBlue,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Palette.valueBackgroundBlue,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  labelColor: Colors.black,
                  indicatorColor: Colors.lightBlue,
                  dividerColor: Colors.lightBlue,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue),
                    insets: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  tabs: const [
                    Tab(
                      text: '사진촬영',
                    ),
                    Tab(
                      text: '갤러리',
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      switch (index) {
                        case 0:
                          {
                            getImage(ImageSource.camera);
                            break;
                          }
                        case 1:
                          {
                            getImage(ImageSource.gallery);
                            break;
                          }
                      }
                    });
                  },
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
                color: Palette.valueBackgroundBlue,
                child: Center(
                  child: SingleChildScrollView(
                    child: showImage(),
                  ),
                ),
              ),
              // second tab bar view widget
              Container(
                color: Palette.valueBackgroundBlue,
                child: SingleChildScrollView(
                  child: showImage(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  textPassportInfoWidget('성/Surname', _surname, 120, 35),
                  SizedBox(
                    width: 10,
                  ),
                  textPassportInfoWidget('성별/Sex', _sex, 50, 35),
                  SizedBox(
                    width: 10,
                  ),
                  textPassportInfoWidget(
                      '여권번호/Passport No.', _passportNumber, 180, 35),
                ],
              ),
              Row(
                children: [
                  textPassportInfoWidget('이름/Given names', _givenName, 150, 35),
                  SizedBox(
                    width: 40,
                  ),
                  textPassportInfoWidget(
                      '생년월일/Date of birth', _birthDate, 180, 35),
                ],
              ),
              Row(
                children: [
                  textPassportInfoWidget(
                      '발급일/Date of issue', _issueDate, 150, 35),
                  SizedBox(
                    width: 40,
                  ),
                  textPassportInfoWidget(
                      '기간만료일/Date of expiry', _expiryDate, 180, 35),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 40,
          thickness: 2,
          indent: 20,
          endIndent: 10,
          color: Colors.grey,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: Size(250, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Palette.valueRed),
          child: const Text('다음으로'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PassportAuthDoneView();
                },
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget textPassportInfoWidget(String text,
      TextEditingController textController, double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            color: Palette.valueBlack,
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 1,
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
    if (_image.path == '') {
      return Container();
    } else {
      return Image.file(_image);
    }
  }
}

Future<CameraDescription> callCamera() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  return firstCamera;
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
