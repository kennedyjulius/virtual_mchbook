import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testsdk/authentication/signup_screen.dart';
import 'package:testsdk/controllers/authentication_controller.dart';
 // Import GoogleSignInController

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
      home: SignupScreen(),
    );
  }
}
