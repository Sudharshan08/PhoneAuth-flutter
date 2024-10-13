import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static String verifyId="";
  // to send otp to user

  static Future sentOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: "+91$phone",
      verificationCompleted: (phoneAuthCredential) async{
        return;
      },
       verificationFailed: (error) async {
        return;
       }, 
       codeSent: (verificationId , forceResendigToken) async{
        verifyId = verificationId;
        nextStep();
       }, 
       codeAutoRetrievalTimeout: (verificationId) async{
        return;
       }
       ).onError((error, StackTrace){
        errorStep();
       });
  }


  //verify otp code

static Future loginWithOtp({required String otp})async{
  final cred= PhoneAuthProvider.credential(verificationId: verifyId, smsCode:otp);

  try{
    final user = await _firebaseAuth.signInWithCredential(cred);
    if(user.user!=null){
      return "Success";
    }
    else{
      return "Error in OTP login";
    }
  }
  on FirebaseAuthException catch(e){
    e.message.toString();
  }
  catch(e){
    return e.toString();
  }
}


//to logout the user

static Future logOut() async {
  await _firebaseAuth.signOut();
}

//check weather user is logged in or not

static Future <bool> isLoggedIn() async {
  var user = _firebaseAuth.currentUser;
  return user!=null;
}

}


