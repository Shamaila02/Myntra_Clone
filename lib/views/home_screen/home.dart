import 'package:myntra_clone/consts/consts.dart';
import 'package:myntra_clone/controllers/home_controller.dart';
import 'package:myntra_clone/views/cart_screen/cart_screen.dart';
import 'package:myntra_clone/views/category_screen/category_screen.dart';
import 'package:myntra_clone/views/home_screen/home_screen.dart';
import 'package:myntra_clone/views/profile_screen/profile_screen.dart';
import 'package:myntra_clone/widgets_common/applogo_widget.dart';
import 'package:myntra_clone/widgets_common/bg_widget.dart';
import 'package:myntra_clone/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  const Home({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26),label:home),
      BottomNavigationBarItem(icon: Image.asset(icCategories ,width: 26),label:categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26),label:cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26),label:account)
    ];
    var navBody = [
     HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),

    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() =>
          BottomNavigationBar
            (currentIndex: controller.currentNavIndex.value,
            selectedItemColor: buttonColor,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items:navbarItem,
            onTap: (value){
              controller.currentNavIndex.value = value;

            },
          ),
      ),
    );

  }
}
