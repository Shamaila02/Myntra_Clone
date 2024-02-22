import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/consts/lists.dart';
import 'package:myntra_clone/views/category_screen/category_details.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 170), itemBuilder: (context,index){
            return Column(
              children:[Image.asset(categoriesImage[index]),
             // 10.heightBox,
              //categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadow.make().onTap(() {
              Get.to(()=>CategoryDetails(title: categoriesList[index]));
            });

          }),
        ),
      )

    );
  }
}
