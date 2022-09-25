import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find<UserController>();

  var selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home")),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text("HomePage"),
            ],
          ),
        ),
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
