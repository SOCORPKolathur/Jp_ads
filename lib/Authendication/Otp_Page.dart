import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jp_ads/Landing_Screen/Landing_Screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';


class Otp_Page extends StatefulWidget {
  String ?Username;
  String ?phonenumber;
   Otp_Page({this.Username,this.phonenumber});

  @override
  State<Otp_Page> createState() => _Otp_PageState();
}

class _Otp_PageState extends State<Otp_Page> {

  OtpFieldController otpController=OtpFieldController();

  @override
  void initState() {
    // TODO: implement initState
    _verifyphone();

    super.initState();
  }
  var _verificationCode;
  String PinValue='';

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff4E82EA),
                  Color(0xff245BCA),
                  Color(0xff245BCA),
                  Color(0xff245BCA),
                ]
            )
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: width/24,right: width/24),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:height/15.12,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(Icons.clear,color: Colors.white,)),
                      )
                    ],
                  ),
                  Image.asset("assets/illustration_pengajuan_berhasil.png",),
                  SizedBox(height:height/25.2,),
                  Text("OTP Verification",style: GoogleFonts.poppins(
                      fontSize: width/14.4,
                      color: Colors.white),),
                  SizedBox(height: height/75.6,),

                  Text("An one time password has be sent\nto phone : +91${widget.phonenumber}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: width/22.5,
                      color: Colors.white),),
                  SizedBox(height: height/18.9,),

                  SizedBox(
                    height:height/15.12,
                    width: double.infinity,
                   // color: Colors.indigo,
                    child: OTPTextField(
                      controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: width/8.142,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor:  Colors.white,
                          borderColor:  Colors.white,
                          disabledBorderColor: Color(0xff4E82EA),
                          focusBorderColor:  Colors.white,
                          backgroundColor: Colors.white

                      ),

                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                      onChanged: (pin) {
                      },
                      onCompleted: (pin) {
                        setState(() {
                          PinValue=pin;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: height/18.9,),

                  GestureDetector(
                    onTap: (){
                  if(PinValue!=""){
                    try{
                      FirebaseAuth.instance.signInWithCredential(
                          PhoneAuthProvider.credential(
                              verificationId:_verificationCode ,
                              smsCode: PinValue)).then((value){
                        if(value.user!=null){
                          userdatacreatefunction();
                        }
                      });
                    }
                    catch(e){
                      print(e);
                    }
                  }

                    },
                    child: Material(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: Container(
                        height:height/15.12,
                        width: width/1.2,
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff4E82EA),
                          //     Color(0xff4E82EA),
                          //   ],
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter
                          // )
                        ),
                        child:   Center(
                          child: Text("Verify Now",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                              fontSize: width/22.5,
                              color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:height/25.2,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phonenumber}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              userdatacreatefunction();

            }
          });
        },
        verificationFailed:(FirebaseAuthException e){

        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          setState(() {
            _verificationCode=verificationid;
          });
        },
        codeAutoRetrievalTimeout:( String verificationid){
          setState(() {
            _verificationCode=verificationid;
          });
        },timeout: const Duration(seconds: 120) );

    //location  function
    //check();

  }


  userdatacreatefunction() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set({
      "name":widget.Username,
      "phone":widget.phonenumber,
      "walletamount":0,
      "userid":FirebaseAuth.instance.currentUser!.uid,
      "picture":"",
      "fcmtoken":token,
      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "time":DateFormat.yMMMd().format(DateTime.now()),
      "timestamp":DateTime.now().millisecondsSinceEpoch
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Landing_Screen(),));
  }

}
