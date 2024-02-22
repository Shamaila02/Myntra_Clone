import 'package:firebase_auth/firebase_auth.dart';
import 'package:myntra_clone/consts/colors.dart';
import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/views/auth_screen/login_screen.dart';
import 'package:myntra_clone/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Change screen method
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=> LoginScreen());
        }
        else{
          Get.to(()=>const Home());
        }
      });
      //using get x
      //Get.to(()=>const LoginScreen());
    });
  }
  @override
  void initState() {
    changeScreen();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      body: Center(
        child: Column(
          children: [
           Align(
             alignment: Alignment.topLeft,
               child: Image.asset(icSplashBg,width: 300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(25).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            //Splash screen is completed
          ],
        ),
      ),
    );
  }
}
