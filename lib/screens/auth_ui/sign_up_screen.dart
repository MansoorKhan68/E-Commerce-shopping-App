import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import 'package:complain_management_system/utills/app_constant.dart';
import 'package:complain_management_system/screens/auth_ui/sign_in_screen.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondaryColor,
          title: const Text(
            "Welcome to My App",
            style: TextStyle(
                color: AppConstant.appTextColor,
                fontSize: 24,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height/20,
              ),
               const Text(
              "SIGN UP HERE",
              style: TextStyle(
                  color: AppConstant.appSecondaryColor,
                  fontSize: 32,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,),
            ),
              
              Container(
                // User name textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // User Name field
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 2, left: 8.0),
                    ),
                  ),
                ),
              ),
              Container(
                // Email textfield
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
                // contact number textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // contact number field
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Number",
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 2, left: 8.0),
                    ),
                  ),
                ),
              ),
              Container(
                // contact number textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // contact number field
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: "City",
                      prefixIcon: const Icon(Icons.location_pin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 2, left: 8.0),
                    ),
                  ),
                ),
              ),
              Container(
                // Password  textfield
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // Password field
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
                      "SIGN UP",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  const Text(
                     "Already have an account?  ",
                     style: TextStyle(color: AppConstant.appSecondaryColor),
                   ),
                   GestureDetector(
                    onTap: () => Get.to(() => const SignInScreen()),
                     child: const Text(
                       "Sign In",
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
