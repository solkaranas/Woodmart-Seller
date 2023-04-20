import 'package:wood_mart_seller/const/consts.dart';
import 'package:wood_mart_seller/controller/home_controller.dart';
import 'package:wood_mart_seller/views/home_screen/home_screen.dart';
import 'package:wood_mart_seller/views/orders/orders_screen.dart';
import 'package:wood_mart_seller/views/products/product_screen.dart';
import 'package:wood_mart_seller/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Homecontroller());

    var navScreens = [
      const HomeScreen(),
      const ProductScreen(),
      const OrdersScreen(),
      const ProfileScreen()
    ];

    var bottomNavBar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard), label: dashboard),
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: product),
      const BottomNavigationBarItem(
          icon: Icon(Icons.post_add_rounded), label: orders),
      const BottomNavigationBarItem(icon: Icon(Icons.settings), label: setting)
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
            onTap: (index) {
              controller.navIndex.value = index;
            },
            currentIndex: controller.navIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: black,
            unselectedItemColor: darkGrey,
            items: bottomNavBar),
      ),
      body: Column(
        children: [
          Obx(()=> Expanded(child: navScreens.elementAt(controller.navIndex.value)))
        ],
      ),
    );
  }
}
