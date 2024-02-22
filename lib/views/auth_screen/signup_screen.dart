import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/consts/lists.dart';
import 'package:myntra_clone/controllers/auth_controller.dart';
import 'package:myntra_clone/widgets_common/applogo_widget.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
import 'package:myntra_clone/widgets_common/custom_textfield.dart';
import 'package:myntra_clone/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key:key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen>{
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Sign Up to $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,
                Obx(()=>
                  Column(
                    children: [
                      customTextField(hint:nameHint,title:name,controller: nameController,isPass:false),
                      customTextField(hint:emailHint,title:email,controller: emailController,isPass:false),
                      customTextField(hint:passwordHint,title:password,controller: passwordController,isPass:true),
                      customTextField(hint:passwordHint,title:confirmPassword,controller: confirmPasswordController,isPass:true),
                      Align(
                          alignment: Alignment.centerRight,
                  
                          child: TextButton(onPressed: () {}, child: forgetPass.text.make())),
                  
                      Row(
                        children: [
                          Checkbox(
                            checkColor: buttonColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          10.widthBox,
                          Expanded(
                            child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily:regular,
                                    color: fontGrey,
                                  )
                                ),
                                TextSpan(
                                    text: termsAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: buttonColor,
                                    )
                                ),
                            
                                TextSpan(
                                    text: " &",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    )
                                ),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily:regular,
                                      color: buttonColor,
                                    )
                                ),
                              ]
                            )),
                          )
                  
                        ],
                      ),
                      5.heightBox,
                      //ourButton().box.width(context.screenWidth -50).make(),
                      controller.isloading.value?
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(buttonColor),):ourButton(color:isCheck == true? buttonColor:lightGrey,title: signup,textColor: whiteColor,onPress: () async {
                        if(isCheck!=false){
                          controller.isloading(true);
                          try{
                            await controller.signupMethod(context:context,email:emailController.text,password:passwordController.text).then((value){
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text
                              );
                            }).then((value) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(()=>Home());
                            } );
                  
                          } catch(e){
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                            controller.isloading(false);
                          }
                        }
                      }).box.width(context.screenWidth -50).make(),
                      10.heightBox,
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(fontFamily: bold,color: fontGrey),
                  
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold,color:buttonColor),
                  
                          )
                        ]
                      ),
                      ).onTap(() {
                        Get.back();
                      }),



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
