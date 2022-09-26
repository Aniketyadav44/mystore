import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/views/pages/cart_screen.dart';
import 'package:mystore/views/pages/feature_screen.dart';
import 'package:mystore/views/pages/profile_screen.dart';
import 'package:mystore/views/pages/search_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController userController = Get.find<UserController>();

  var selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List screens = [
    const FeatureScreen(),
    ProfileScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Container(
            height: 42,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 0,
              child: TextFormField(
                onFieldSubmitted: (res) {
                  Get.to(() => SearchProductScreen(query: res));
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: ColorConstants.secondaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Badge(
                animationType: BadgeAnimationType.scale,
                badgeColor: Colors.grey,
                badgeContent: Obx(() =>
                    Text(userController.user.value.cart.length.toString())),
                child: const Icon(Icons.shopping_cart_outlined)),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
