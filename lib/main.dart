import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testsdk/authentication/signup_screen.dart';
import 'package:testsdk/common/widgets/nacscreen.dart';

import 'package:testsdk/onboarding/onboardingscreen.dart';
import 'package:testsdk/otherscreens/antenatal_screen.dart';

Future<void> main() async {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      //home: showHome ? NavScreen() : OnboardingScreen(),
      home: SignupScreen(),
    );
  }
}

//logout button
// final prefs = await SharedPreferences.getInstance();
// prefs.setBool('showHome', false);
