import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:value_up/core/util/login/kakao_login.dart';
import 'package:value_up/core/util/login/main_view_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'package:value_up/presentation/login/login_view.dart';
import 'package:value_up/presentation/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_KEY']);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Gachiga());
}

class Gachiga extends StatelessWidget {
  const Gachiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomeView': (_) => const HomeView(),
      },
      title: 'gachiga app',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KO'),
        Locale('en', 'US'),
      ],
      home: LoginView(),
    );
  }
}
