import 'package:myntra_clone/consts/consts.dart';

Widget homeButtons({width,height,icon,String? title,onPress,topCategories}){
  return
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon,width: 26,),
          10.heightBox,
          title!.text.fontFamily(semibold).color(darkFontGrey).make()
        ],

  ).box.rounded.white.size(width, height).make();
}