import 'package:flutter/material.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("HomePage"),
              CustomButton(
                  onPressedFunc: () {
                    UserServices().logOut();
                  },
                  text: 'Log Out')
            ],
          ),
        ),
      ),
    );
  }
}
