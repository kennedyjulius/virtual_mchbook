import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/common/utils/colors.dart';
import 'package:testsdk/common/widgets/accounts_listtile.dart';
import 'package:testsdk/common/widgets/custom_textwidget.dart';

class AccountScreen extends StatefulWidget {
  //final UserDetails userDetails;
  const AccountScreen({super.key,  
  //this.userDetail
  });

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
              text: "Profile Information",
              size: 20,
              color: ColorsContants.textColormain,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey.withOpacity(0.3),
            foregroundImage: AssetImage("assets/profile.jpg"),
          ),
          // Text("Welcome, ${widget.userDetails.name}"),
          // Text("Email, ${widget.userDetails.email}"),
          SizedBox(
            height: 10,
          ),
          CustomTextWidget(
              text: "+254743702820?",
              size: 12,
              color: ColorsContants.textColorsubtitle,
              fontWeight: FontWeight.w300),
          SizedBox(
            height: 5,
          ),
          CustomTextWidget(
              text: "Meru Level 5 Hospital",
              size: 8,
              color: ColorsContants.textColorsubtitle,
              fontWeight: FontWeight.w200),
          SizedBox(
            height: 20,
          ),
          CustomListTile(
              ontap: () {
                Get.snackbar("Alert Message", "You Tapped me");
              },
              title: "Edit Profile",
              subtitle: "User information",
              color: Colors.purple.shade100,
              icon: Icons.edit,
              trailingIcon: Icon(Icons.arrow_forward_ios)),
          SizedBox(
            height: 5,
          ),
          CustomListTile(
                ontap: () {
                Get.snackbar("Alert Message", "You Tapped me");
              },
              title: "Change Password",
              subtitle: "identity verification",
              color: Colors.purple.shade100,
              icon: Icons.password,
              trailingIcon: Icon(Icons.arrow_forward_ios)),
          SizedBox(
            height: 5,
          ),
          CustomListTile(
              ontap: () {
                Get.snackbar("Alert Message", "You Tapped me");
              },
              title: "Change Location",
              subtitle: "Change Location",
              color: Colors.purple.shade100,
              icon: Icons.location_on,
              trailingIcon: Icon(Icons.arrow_forward_ios)),
          SizedBox(
            height: 5,
          ),
          CustomListTile(
              ontap: () {
                Get.snackbar("Alert Message", "You Tapped me");
              },
              title: "Facility Information",
              subtitle: "Accredited by KMPDU",
              color: Colors.purple.shade100,
              icon: Icons.local_hospital,
              trailingIcon: Icon(Icons.arrow_forward_ios)),
          SizedBox(
            height: 5,
          ),
          CustomListTile(
              ontap: () {
                Get.snackbar("Alert Message", "You Tapped me");
              },
              title: "Log Out",
              subtitle: "Delete account",
              color: Colors.red.shade200,
              icon: Icons.logout_outlined,
              trailingIcon: Icon(Icons.arrow_forward_ios)),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class UserDetails {
  final String name;
  final String email;

  UserDetails({required this.name, required this.email});
}