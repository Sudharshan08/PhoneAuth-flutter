import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_service.dart';
import 'package:flutter_application_1/main_wrapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/pages/getapi.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _formKey1 =GlobalKey<FormState>();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(child: SvgPicture.asset("assets/Seal_of_Karnataka - Copy.svg",
              //fit: BoxFit.cover
              width: 400,
              height: 600,),
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text("Hi, welcome back",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    const Text("Enter your phone number to continue"),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixText: "+91",
                      labelText: "Enter your phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    validator: (value){
                      if(value!.length!=10)
                      return "Invalid phone number";
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()){
                      AuthService.sentOtp(
                        phone:_phoneController.text,
                         errorStep: ()=> ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:Text( 
                            "Error in sending OTP",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,
                            ),
                            ), 
                         nextStep: (){
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: Text("OTP verification"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Enter 6 Digit OTP"),
                                SizedBox(height: 12,
                                ),
                Form(
                  key: _formKey1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _otpController,
                    decoration: InputDecoration(
                      labelText: "Enter your OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    validator: (value){
                      if(value!.length!=6)
                      return "Invalid OTP";
                      return null;
                    },
                  ),
                ),

                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  if(_formKey1.currentState!.validate()){
                                    AuthService.loginWithOtp(otp: _otpController.text).then((value){
                                      if(value=="Success"){
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,MaterialPageRoute(
                                            builder: (context)=>MainWrapper()
                                             ),
                                         );
                                      }
                                      else{
                                        Navigator.pop(context);
                                         ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content:Text( 
                                         "Invalid OPT....",
                                         style: TextStyle(color: Colors.white),
                                         ),backgroundColor: Colors.red,
                                          ),
                                         );
                                      }
                                    });
                                  }
                                }, 
                                child: Text('Submit'),)
                            ],
                          ));
                         }
                         );
                    }
                  }, child: Text("Send OTP"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black
                  ),
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}