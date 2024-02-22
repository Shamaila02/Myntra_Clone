import 'package:myntra_clone/consts/consts.dart';
 import 'package:myntra_clone/widgets_common/applogo_widget.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
 import 'package:myntra_clone/widgets_common/custom_textfield.dart';
Widget ourButton({onPress,color,textColor,String? title}){
  return ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary:color,
        padding: const EdgeInsets.all(10)
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).size(20).fontFamily(bold).make());
}