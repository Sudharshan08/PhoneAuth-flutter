import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/main_wrapper_controller.dart';
import 'package:flutter_application_1/pages/getapi.dart';
import 'package:flutter_application_1/pages/settings_page.dart';

import 'package:flutter_application_1/settings_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_application_1/pages/ticket_page.dart';

import 'package:flutter_application_1/pages/home_page.dart';

class MainWrapper extends StatelessWidget {
   MainWrapper({super.key});

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //centerTitle: true,
        //backgroundColor: Colors.blue,
        //elevation: 0,
       // title: Text("",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
       // ),
      //),
      body:  PageView(
        controller: controller.pageController,
        physics: BouncingScrollPhysics(),
          children:[
             Getapi(),
            const TicketPage(),
            const ProfileScreen(),
             const HomeScreen(),
          ],
        ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  context, 
                  icon: Iconsax.home1, 
                  page: 0, 
                  label: "Home"),
        
                    _bottomAppBarItem(
                  context, 
                  icon: Iconsax.add, 
                  page: 1, 
                  label: "Add Ticket"),
        
                    _bottomAppBarItem(
                  context, 
                  icon: Iconsax.setting, 
                  page: 2, 
                  label: "Settings"),
                   _bottomAppBarItem(
                  context, 
                  icon: Iconsax.setting, 
                  page: 3, 
                  label: "LogOut Page"),
              ],
            ),
          ),
        ),
      );
  }

  Widget _bottomAppBarItem(BuildContext context, {required icon, required page, required label}){
    return ZoomTapAnimation(
      onTap:()=>controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon
              ),
              Text(label)
          ],
        ),
      ),
    );
  }
}
