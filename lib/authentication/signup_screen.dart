// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/widgets/custom_button.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';
import 'package:testsdk/common/widgets/myform_field.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsContants.textColor3,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              CustomTextWidget(
                  text: "Sign Up to continue",
                  size: 22,
                  color: ColorsContants.textColormain,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomTextWidget(
                        text: "Welcome back",
                        size: 17,
                        color: ColorsContants.textColorsubtitle,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/star.gif"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              MyformField(
                labelText: "Username",
                hintText: "Enter Username",
                controller: _usernamecontroller,
                obscureText: false,
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(
                height: 10,
              ),

              //text field containing username
              MyformField(
                labelText: "email",
                hintText: "email address",
                controller: _emailcontroller,
                obscureText: false,
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(
                height: 10,
              ),

              //password field
              MyformField(
                labelText: "password",
                hintText: "Enter Password",
                controller: _passwordcontroller,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.visibility_off)),
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(
                height: 10,
              ),

              TextButton(onPressed: () {}, child: Text("Forgot Password? ...")),
              SizedBox(
                height: 10,
              ),

              //custom button
              CustomButton(
                text: "Sign up",
                ontap: () {
                  print("you clicked me");
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                      text: "Not a member yet ?",
                      size: 14,
                      color: ColorsContants.textColorsubtitle,
                      fontWeight: FontWeight.w200),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(onPressed: () {}, child: Text("Login here...")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
