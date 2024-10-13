import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_service.dart';
import 'package:flutter_application_1/pages/login_page.dart';

 class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Great you are now logged in."),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: (){
              AuthService.logOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  
}