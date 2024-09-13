import 'package:complain_management_system/controllers/google_sign_in_controller.dart';
import 'package:complain_management_system/utills/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GoogleSignInController googleSignInController = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppConstant.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Nayab Collection",
          style: TextStyle(color: AppConstant.appTextColor,fontWeight: FontWeight.w700,letterSpacing: 2),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // animation
            child: Lottie.asset("assets/images/splash-icon.json"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
              // text
              "💕 Happy Shoping 🛍️🛒",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 2),
            ),
          ),  // Free space
          SizedBox(
            height: Get.height / 12,
          ),
          Material(  // Google sign in button
            child: Container(
              width: Get.width / 1.3,
              height: Get.height / 14,
              decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                onPressed: () {
                  googleSignInController.signInWithGoogle();
                },
                label: const Text(
                  // button text
                  "Sign In with google",
                  style:
                      TextStyle(color: AppConstant.appTextColor, fontSize: 12,fontWeight: FontWeight.w800),
                ),  // button icon Google logo
                icon: Image.asset("assets/images/google-logo.png"),
              ),
            ),
          ),  // free space
          SizedBox(width: Get.width / 1.3,
              height: Get.height / 50,),
            Material( // Another sign in with email option
            child: Container(
              width: Get.width / 1.3,
              height: Get.height / 14,
              decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                onPressed: () {},
                label: const Text( // icon button text
                  "Sign In with Email",
                  style:
                      TextStyle(color: AppConstant.appTextColor, fontSize: 12,fontWeight: FontWeight.w800),
                ),  // Email Icon
                icon: const Icon(Icons.email,color: AppConstant.appTextColor,size: 50,),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
