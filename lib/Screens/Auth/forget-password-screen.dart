// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:summer_project/Controllers/forget-password-controller.dart';
import 'package:summer_project/Controllers/sign-in-controller.dart';
import 'package:summer_project/Screens/Auth/signup-screen.dart';
import 'package:summer_project/Screens/User/main-screen.dart';
import 'package:summer_project/Utils/app-constants.dart';

class forgetPasswordScreen extends StatefulWidget {
  const forgetPasswordScreen({super.key});

  @override
  State<forgetPasswordScreen> createState() => _forgetPasswordScreenState();
}

class _forgetPasswordScreenState extends State<forgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondaryColor,
          title: Text(
            "Forgot Password",
            style: TextStyle(
                color: AppConstant.appTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset('assets/images/ShoppingCart.json'),
                      ],
                    ),
              SizedBox(
                height: Get.height / 32,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "E-mail",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10.0),
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     "Forgot password?",
              //     style: TextStyle(
              //         color: AppConstant.appSecondaryColor,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              SizedBox(
                height: Get.height / 32,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text("Continue",
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      String email = userEmail.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar("Error", 'Please fill all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor);
                      } else {
                        String email = userEmail.text.trim();
                        forgetPasswordController.ForgetPasswordMethod(email);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 48,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Don't have an account?",
              //         style: TextStyle(
              //           color: AppConstant.appSecondaryColor,
              //           fontSize: 16,
              //         )),
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pushReplacement(
              //           PageRouteBuilder(
              //             pageBuilder:
              //                 (context, animation, secondaryAnimation) =>
              //                     SignUpScreen(),
              //             transitionsBuilder:
              //                 (context, animation, secondaryAnimation, child) {
              //               const begin =
              //                   Offset(-1.0, 0.0); // Starting from the left
              //               const end =
              //                   Offset.zero; // Ending at the current position
              //               const curve = Curves.easeInOut;

              //               var tween = Tween(begin: begin, end: end)
              //                   .chain(CurveTween(curve: curve));
              //               var offsetAnimation = animation.drive(tween);

              //               return SlideTransition(
              //                   position: offsetAnimation, child: child);
              //             },
              //           ),
              //         );
              //       },
              //       child: Text("Sign Up?",
              //           style: TextStyle(
              //               color: AppConstant.appSecondaryColor,
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold)),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      );
    });
  }
}
