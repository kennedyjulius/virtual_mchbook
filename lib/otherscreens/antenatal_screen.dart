// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AntenatalProfileScreen extends StatefulWidget {
  const AntenatalProfileScreen({super.key});

  @override
  State<AntenatalProfileScreen> createState() => _AntenatalProfileScreenState();
}

class _AntenatalProfileScreenState extends State<AntenatalProfileScreen> {
  final myItems = [
    Image.asset(
      "assets/consultation.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/landingpage.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/fathermother.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/profile.png",
      fit: BoxFit.cover,
    ),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              items: myItems
                  .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.red,
                          //strokeAlign: 2.0,
                          //: 2.0
                        ),
                      ),
                      child: item,
                    ),
                  ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 0.8,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10,),
            AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: myItems.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Colors.grey.shade200,
                activeDotColor: Colors.purpleAccent,
                paintStyle: PaintingStyle.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
