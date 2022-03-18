import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/model_classes/get_user.dart';
import 'package:kashif/screens/login-Screens/otp_verify_code.dart';
import 'package:kashif/screens/login-Screens/sign_up_ui.dart';
import 'package:kashif/utils.dart';

class UserAuthProvider extends ChangeNotifier {
  var formValidation = FormValidation();
  bool securePassword = true;
  bool isNotValid = true;
  String userName = "";
  String mobileNumber = "";
  String emailAddress = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId="";

  void checkSignupFormValidity() {
    if (userName.isNotEmpty &&
        mobileNumber.isNotEmpty &&
        emailAddress.isNotEmpty &&
        password.isNotEmpty &&
        GetUtils.isEmail(emailAddress) &&
        password.length > 6) {
         Get.to(() =>  OtpVerifyCode());




    } else {
      showMessage("Invalid Details");
    }
  }

  void sendOTP() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        logger.e("verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException e) {
        logger.e("verificationFailed   $e");

      },
      codeSent: (String verificationId, int? resendToken) async{
        this.verificationId=verificationId;

        // await Future.delayed(Duration(seconds: 2),);
        dismissDialogue();
        // logger.e("codeSent");
        showMessage("Code Sent.");

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // logger.e("codeAutoRetrievalTimeout");

      },
    );


  }

  void verifyOTP(String verificationCode, bool isFromLogin) async {
   if (verificationId == null) {
     logger.i("NOT OK");
     return;
   }

   showMessage("Verifying");
   showProgress();
   var credential =  PhoneAuthProvider.credential(verificationId: verificationId, smsCode: verificationCode);

   await FirebaseAuth.instance.signInWithCredential(credential).then((value) {

   if(isFromLogin){
   ApiServices.loginUser();
   }
   else {
       ApiServices.registerUser();
     }

   }).onError((error, stackTrace) {
     logger.e(error);
   });



  }
  bool isUserLoaded=false;
  GetUser? userFromJson;
  void setuserInfoData(bool isUserLoaded, GetUser userFromJson) {
    this.isUserLoaded=isUserLoaded;
    this.userFromJson=userFromJson;
    notifyListeners();
  }


}
