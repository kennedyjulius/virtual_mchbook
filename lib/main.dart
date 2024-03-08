import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testsdk/authentication/signup_screen.dart';
import 'package:testsdk/controllers/authentication_controller.dart';
import 'package:testsdk/otherscreens/maternal/maternal_screen.dart';
// Import GoogleSignInController

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // ignore: prefer_const_constructors
      options: FirebaseOptions(
          apiKey: "AIzaSyByxzlFYVLGq2xlk_eiDOFZ86C-oWFvf0A",
          appId: "1:68789805084:android:9f80624fadc3f0e7d3ffd9",
          messagingSenderId: "68789805084",
          projectId: "handbook-ebad8"));

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
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
          // Your theme settings
          ),
      initialBinding: BindingsBuilder(() {
        Get.put<GoogleSignInController>(GoogleSignInController());
      }),
      home: MaternalScreen(),
    );
  }
}
