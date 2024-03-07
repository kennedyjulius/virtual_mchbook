// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import 'package:testsdk/authentication/login_screen.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/widgets/custom_button.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';
import 'package:testsdk/common/widgets/myform_field.dart';
import 'package:testsdk/controllers/authentication_controller.dart';
import 'package:testsdk/otherscreens/antenatal_screen.dart';

enum SupportState {
  unknown,
  supported,
  unSupported,
}

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _obscurePassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;

  List<BiometricType>? availableBiometrics;

  void initState() {
    super.initState();
    checkBiometric();
    getAvailableBiometrics();
    auth.isDeviceSupported().then((bool isSupported) => setState(() =>
        supportState =
            isSupported ? SupportState.supported : SupportState.unSupported));
  }

  Future<void> checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
      print("Biometrics supported: $canCheckBiometric");
    } catch (e) {
      print(e);
      canCheckBiometric = false;
    }
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> biometricTypes;
    try {
      biometricTypes = await auth.getAvailableBiometrics();
      print("Supported biometrics $biometricTypes");
    } catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      availableBiometrics = biometricTypes;
    });
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      final authenticated = await auth.authenticate(
          localizedReason: "Authenticate with fingerprint or Face ID",
          options: AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));
      if (!mounted) {
        return;
      }

      if (authenticated) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AntenatalProfileScreen(),
            ));
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  final GoogleSignInController _googleSignInController = Get.find();
  

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
              SizedBox(height: 40),
              CustomTextWidget(
                text: "Sign Up to continue",
                size: 22,
                color: ColorsContants.textColormain,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: "Welcome back",
                      size: 17,
                      color: ColorsContants.textColorsubtitle,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/star.gif"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MyformField(
                labelText: "Username",
                hintText: "Enter Username",
                obscureText: false,
                controller: _usernameController,
                suffixIcon: IconButton(
                  onPressed: () => _usernameController.clear(),
                  icon: Icon(Icons.clear),
                ),
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10),
              MyformField(
                labelText: "Email",
                hintText: "Email Address",
                obscureText: false,
                controller: _emailController,
                suffixIcon: IconButton(
                  onPressed: () => _emailController.clear(),
                  icon: Icon(Icons.clear),
                ),
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 10),
              MyformField(
                labelText: "Password",
                hintText: "Enter Password",
                obscureText: _obscurePassword,
                controller: _passwordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password? ..."),
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Sign up",
                ontap: () {
                  print("you clicked me");
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: "Already a member ?",
                      size: 14,
                      color: ColorsContants.textColorsubtitle,
                      fontWeight: FontWeight.w200,
                    ),
                    SizedBox(width: 2),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      child: Text("Login here..."),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10),
              
              Center(child: Text("Or", style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () => authenticateWithBiometrics(),
                child: Container(
                  height: 70,
                  width: 250,
                  //color: Colors.purpleAccent.shade400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                      style: BorderStyle.solid
                    )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 2,),
                      Image.asset("assets/fingerprint.gif"),
                      SizedBox(width: 10,),
                      Text("Register with Fingerprint"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4,),

              //sign in with google
              SignInButton(
                imagePosition: ImagePosition.left,
                buttonType: ButtonType.google, 
                onPressed: () => _googleSignInController.signInWithGoogle(),)
            ],
          ),
        ),
      ),
    );
  }
}


