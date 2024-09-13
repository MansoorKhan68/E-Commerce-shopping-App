import 'package:complain_management_system/screens/auth_ui/welcome_screen.dart';
import 'package:complain_management_system/utills/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      
      centerTitle: true,
      backgroundColor: AppConstant.appMainColor,
     title: Text(AppConstant.appMainName),
     // ignore: prefer_const_literals_to_create_immutables
     actions: [
      GestureDetector(
        onTap: ()async{
          GoogleSignIn googleSignIn = GoogleSignIn();
          googleSignIn.signOut();
          Get.to(() => const WelcomeScreen());
        },
        child: const Padding(
         padding: EdgeInsets.all(8.0),
         child:   Icon(Icons.logout),
             ),
      )],),
      );
  }
}