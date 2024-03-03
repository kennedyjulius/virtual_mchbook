import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testsdk/authentication/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        allowImplicitScrolling: true,
        pages: [
          commonPageViewModel(
            "Enjoy your day With you",
            "You can kickstart your day with short amazing videos from our platform",
            "assets/breestfeeding.png",
          ),
          commonPageViewModel(
            "Are you tired from work?",
            "Look no further @youtube we got your happiness covered and well figured, kindly give us a tap today",
            "assets/consultation.png",
          ),
          commonPageViewModel(
            "Hey, Do you Dislike Ads?",
            "We got you covered, we dont want to spam your happy moments with ads",
            "assets/father&mother.png",
          ),
        ],
        dotsDecorator: DotsDecorator(
          size: Size(5, 10),
          activeColor: Colors.purple.shade100,
          activeSize: Size(20, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        showDoneButton: true,
        done: Text(
          "Done",
          style: TextStyle(fontSize: 20),
        ),
        showNextButton: true,
        next: Text("Next"),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(fontSize: 20),
        ),
        onDone: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ));
        },
        onSkip: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ));
        },
      ),
    );
  }

  PageViewModel commonPageViewModel(
      String title, String bodyText, String image) {
    return PageViewModel(
      title: title,
      body: bodyText,
      image: Image.asset(image),
      decoration: PageDecoration(
        pageColor: Colors.purple.shade700,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
