import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/consts/lists.dart';
import 'package:myntra_clone/controllers/auth_controller.dart';
import 'package:myntra_clone/controllers/profile_controller.dart';
import 'package:myntra_clone/services/firestore_services.dart';
import 'package:myntra_clone/views/auth_screen/login_screen.dart';
import 'package:myntra_clone/views/profile_screen/components/details_card.dart';
import 'package:myntra_clone/views/profile_screen/edit_profile_screen.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
var controller= Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(buttonColor),
                ),
              );
            }
            else{
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    //edit profile button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const  Align(alignment: Alignment.topRight,child: Icon(Icons.edit,color: whiteColor)).onTap(() {
                        controller.nameController.text=data['name'];
                        controller.passController.text=data['password'];
                        Get.to(()=>EditProfileScreen(data: data));
                      }),
                    ),
                    Row(
                      children: [
                        data['imageUrl'] == ''?

                        Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
                        Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}".text.fontFamily(semibold).white.make(),
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: whiteColor,
                                )
                            ),

                            onPressed: () async{
                              await Get.put(AuthController()).signoutMethod(context);
                              Get.offAll(()=> const LoginScreen());
                            },
                            child: logout.text.fontFamily(semibold).white.make())
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(count: data['cart_count'],title: "in your cart",width: context.screenWidth/3.4),
                        detailsCard(count: data['wishlist_count'],title: "in your whishlist",width: context.screenWidth/3.4),
                        detailsCard(count: data['order_count'],title: "your orders",width: context.screenWidth/3.4),
                      ],
                    ),

                    //buttons Section
                    20.heightBox,

                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context,index){
                        return Divider(
                          color: lightGrey,
                        );
                      },
                      itemCount: profileButtonsList.length,
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          leading:Image.asset(profileButtonsIcon[index],width: 22,) ,
                          title:  profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        );
                      },
                    ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(whiteColor).make(),
                  ],
                ),
              );
            }
          },
        )
      ),

    );
  }
}
