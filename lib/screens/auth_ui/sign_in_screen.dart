import 'package:complain_management_system/screens/auth_ui/sign_up_screen.dart';
import 'package:complain_management_system/utills/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondaryColor,
          title: const Text(
            "Welcome back",
            style: TextStyle(
                color: AppConstant.appTextColor,
                fontSize: 28,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isKeyboardVisible
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset("assets/images/splash-icon.json"),
                      ],
                    ),
              // welcome back text
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  // text
                  "LOGIN HERE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 2,
                      color: AppConstant.appSecondaryColor),
                ),
              ), // Free space
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                // email and password textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // email field
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 2, left: 8.0),
                    ),
                  ),
                ),
              ),
              Container(
                // Password and password textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // email field
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: const Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 2, left: 8.0),
                    ),
                  ),
                ),
              ),
              // forget Password
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstant.appSecondaryColor,
                  ),
                ),
              ),
              SizedBox(
                // Free space
                height: Get.height / 20,
              ),
              Material(
                // Email sign in button
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 20,
                  decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      // button text
                      "SIGN IN",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800),
                    ), // button icon Google logo
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text(
                     "Don't have an account?  ",
                     style: TextStyle(color: AppConstant.appSecondaryColor),
                   ),
                   GestureDetector(
                    onTap: () => Get.to(() => const SignUpScreen()),
                     child: const Text(
                       "Sign Up",
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: AppConstant.appSecondaryColor,fontSize: 16),
                     ),
                   ),
                 ],
               )
            ],
          ),
        ),
      );
    });
  }
}
