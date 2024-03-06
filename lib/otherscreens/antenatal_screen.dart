// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';

class AntenatalProfileScreen extends StatefulWidget {
  const AntenatalProfileScreen({super.key});

  @override
  State<AntenatalProfileScreen> createState() => _AntenatalProfileScreenState();
}

class _AntenatalProfileScreenState extends State<AntenatalProfileScreen> {
  final myItems = [
    Image.asset(
      "assets/babyequipments.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/babyshower.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/holdingbaby.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/mothersday.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/pregnantlady.png",
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
                  CustomTextWidget(
                  text: "Recommended for you ... ",
                  size: 22,
                  color: ColorsContants.textColormain,
                  fontWeight: FontWeight.bold),
            SizedBox(height: 10,),
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
                          color: Colors.purple.shade200,
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
                activeDotColor: Colors.blueAccent,
                paintStyle: PaintingStyle.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
