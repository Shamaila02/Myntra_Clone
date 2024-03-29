import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/consts/lists.dart';
import 'package:myntra_clone/widgets_common/our_button.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
class ItemsDetails extends StatelessWidget {
  final String? title;

  const ItemsDetails({Key? key, required this.title}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Swiper section
                      VxSwiper.builder(
                        autoPlay: true,
                          height: 350,
                          itemCount: 3,
                          aspectRatio: 16/9,
                          itemBuilder: (context,index){
                        return Image.asset(
                            e1,
                            width: double.infinity,
                            fit: BoxFit.cover);

                      }),
                      10.heightBox,
                      //title and details
                      title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                      10.heightBox,
                      //rating
                      VxRating(onRatingUpdate: (value){},
                        normalColor: textfieldGrey,
                        selectionColor: golden,

                        count: 5,
                        size: 25,
                        stepInt: true),
                      10.heightBox,
                      "\Rs.2500".text.color(buttonColor).fontFamily(bold).size(18).make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make()
                            ],
                          )),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded,color: darkFontGrey,),
                          ),
                        ],
                      ).box.height(60).padding(EdgeInsets.symmetric(horizontal:16 )).color(textfieldGrey).make(),
                      //color section
                      20.heightBox,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Color:".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: List.generate(3, (index) =>VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal:4)).make(),
                                )
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          //Quantity row
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Color:".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                                    "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                                    10.widthBox,
                                    "(0 available)".text.color(textfieldGrey).make(),
                                  ],
                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          //Total row
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total:".text.color(textfieldGrey).make(),
                              ),
                             "\Rs 0.00".text.color(buttonColor).size(16).fontFamily(bold).make(),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        ],

                      ).box.white.shadowSm.make(),

                      //description
                      10.heightBox,
                      "Description ".text.color(darkFontGrey).fontFamily(semibold).make(),
                      10.heightBox,
                      "This is a dummy item and dummy description here...".text.color(darkFontGrey).make(),

                      //buttons section
                      10.heightBox,
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          itemDetailButtonList.length,
                                (index) => ListTile(
                          title: itemDetailButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                          trailing: Icon(Icons.arrow_forward),
                        )),
                      ),
                      20.heightBox,
                      //products may like section
                      productyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(6, (index) =>Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ea2,
                                width: 130,
                                fit: BoxFit.cover,

                              ),
                              10.heightBox,
                              "Ethnic wear".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              "\Rs.1600".text.color(buttonColor).fontFamily(bold).size(16).make(),
                              10.heightBox,

                            ],
                          )
                          .box.white.margin(
                              const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                        ),
                      )
                    ],
                  ),
                ),
              )), //Container //Expanded
          SizedBox(

            width: double.infinity,
            height: 60,
            child: ourButton(color: buttonColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to Cart"),
          ),
        ],
      ), //Column
    );
  }
}



