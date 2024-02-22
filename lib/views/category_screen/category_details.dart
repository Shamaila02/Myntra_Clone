import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/views/category_screen/items_details.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
final  String? title;

  const CategoryDetails({Key ? key, required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:List.generate(6, (index) => "Ethnic wear".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),
20.heightBox,


//items container
            Expanded(

              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8),
                  itemBuilder: (context, index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e1,
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      "Ethnic wear".text.fontFamily(semibold).color(darkFontGrey).make(),
                      10.heightBox,
                      " Rs.2500".text.color(buttonColor).fontFamily(bold).size(16).make(),
                      10.heightBox
                    ],
                  ).box
                    .white
                    .margin(const EdgeInsets.symmetric(horizontal:4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12))
                      .make().onTap(() {
                        Get.to(()=> ItemsDetails(title: "Dummy item"));
                  });

                  }),
            )

            ],
          ),
        ),
      )
    );
  }
}
