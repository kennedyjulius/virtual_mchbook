import 'package:flutter/material.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    CustomTextWidget(
                      text: "Don't have account yet ?",
                      size: 20,
                      color: ColorsContants.textColormain,
                      fontWeight: FontWeight.bold
                      ),
                      SizedBox(height: 30,),
                      CircleAvatar(
                        foregroundImage: AssetImage("assets/"),
                      )
        ],
      ),
    );
  }
}