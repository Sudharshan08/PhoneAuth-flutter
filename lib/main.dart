import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_service.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp();
  runApp(const MyApp());
}
//void main(){
  //runApp(const MyApp());
//}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
            title: "FlutterPhoneAuth",
        debugShowCheckedModeBanner: false,
        //home: CheckUserLoggedInOrNot(),
        home:WelcomeScreen() ,
      );
  }
}


class CheckUserLoggedInOrNot extends StatefulWidget {
  const CheckUserLoggedInOrNot({super.key});

  @override
  State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
}

class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {

  @override
   @override
  void initState() {
    AuthService.isLoggedIn().then((value){
      if(value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
      }
    });

    
    super.initState();
    
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}