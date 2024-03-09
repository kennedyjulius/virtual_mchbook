import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testsdk/authentication/auth_controller.dart';
import 'package:testsdk/controllers/authentication_controller.dart';
import 'package:testsdk/onboarding/onboardingscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAUwWrwmbC64fGiVP7hdZx6TuqkVDXIiUI",
      appId: "1:948486970016:android:c1d382eab3534bf53007c5",
      messagingSenderId: "948486970016",
      projectId: "virtual-mch-handbook",
    ),
  ).then((value) => Get.put(AuthController()));

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        // Your theme settings
      ),
      initialBinding: BindingsBuilder(() {
        Get.put<GoogleSignInController>(GoogleSignInController());
      }),
      home: OnboardingScreen(),
    );
  }
}
