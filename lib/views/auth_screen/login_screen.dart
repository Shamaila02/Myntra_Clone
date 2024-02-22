import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/consts/lists.dart';
import 'package:myntra_clone/controllers/auth_controller.dart';
import 'package:myntra_clone/views/auth_screen/signup_screen.dart';
import 'package:myntra_clone/views/home_screen/home_screen.dart';
import 'package:myntra_clone/widgets_common/applogo_widget.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
import 'package:myntra_clone/widgets_common/custom_textfield.dart';
import 'package:myntra_clone/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
           Obx(
               ()=>
           Column(
               children: [
                 customTextField(hint:emailHint,title:email,isPass:false,controller:controller.emailController),
                 customTextField(hint:passwordHint,title:password,isPass: true,controller: controller.passwordController),
                Align(
                  alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: forgetPass.text.make())),
                 5.heightBox,
                 controller.isloading.value ? CircularProgressIndicator(
                   valueColor: AlwaysStoppedAnimation(buttonColor),
                 ):
                 //ourButton().box.width(context.screenWidth -50).make(),
                 ourButton(color: buttonColor,title: login,textColor: whiteColor,onPress: ()
                  {
                   Get.to(()=>const Home());
                 }).box.width(context.screenWidth -50).make(),
                 5.heightBox,
                 createNewAccount.text.color(fontGrey).make(),
                 5.heightBox,
                 ourButton(
                     color: bodyColor2,title: signup,textColor: whiteColor,onPress: () async{
                       controller.isloading(true);
                       await controller.loginMethod(context: context).then((value) {
             
                       if(value!=null){
                         VxToast.show(context, msg: loggedin);
                         Get.offAll(()=>const Home());
                       }
                       else{
                         controller.isloading(false);
                       }
                       });
                   Get.to(()=>SignupScreen());
                 }).box.width(context.screenWidth -50).make(),
                 10.heightBox,
                 loginWith.text.color(fontGrey).make(),
                 5.heightBox,
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(3, (index) =>
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CircleAvatar(
                                            backgroundColor: lightGrey,
                                            radius: 25,
                                            child: Image.asset(socialIconList[index],
                                            width: 30,),
                                          ),
                       )),
             
             
                 )
               ],
             ).box.white.rounded.padding(const EdgeInsets.all(16)).
             width(context.screenWidth -70).
                 shadowSm.
             make(),
           ),

          ],
        ),
      ),
    ));
  }
}
