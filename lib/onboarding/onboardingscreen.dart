import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:testsdk/authentication/signup_screen.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 58),
        child: IntroductionScreen(
          pages: [
            commonPageViewModel(
                "assets/breestfeeding.png"
                ),
            //page 2
            commonPageViewModel(
                
                "assets/consultation.png"),
            //page 3
            commonPageViewModel(
                "assets/father&mother.png"),
          ],
          dotsDecorator: DotsDecorator(
              size: Size(5, 10),
              activeColor: Colors.blue.shade100,
              activeSize: Size(20, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              )),
          showDoneButton: true,
          done: Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: Icon(Icons.keyboard_arrow_right_outlined),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          onDone: () {
            Get.snackbar("Alert Message", "You have successful skipped ...");
            Get.offAll(SignupScreen());
          },
        ),
      ),
    );
  }

  PageViewModel commonPageViewModel(image) {
    return PageViewModel(
        image: Image.asset(image),
        decoration: PageDecoration(
            pageColor: Colors.redAccent.shade700,
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));
  }
}
