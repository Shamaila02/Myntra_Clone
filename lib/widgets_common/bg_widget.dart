import 'package:myntra_clone/consts/consts.dart';

Widget bgWidget({Widget?child}){
  return Container(
  decoration: BoxDecoration(

    // image: DecorationImage(image: AssetImage(imgBackground),fit:BoxFit.fill ),
      color: buttonColor,

  ),
    child: child,
    );
}