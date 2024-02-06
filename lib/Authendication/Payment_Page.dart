
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Landing_Screen/Landing_Screen.dart';


class Payment_Page extends StatefulWidget {
  String ? Type;
  String ? Username;
  String ? Userphone;
   Payment_Page({this.Type,this.Username,this.Userphone});

  @override
  State<Payment_Page> createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {

  TextEditingController Usernamecontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();
  TextEditingController amountcontroller=TextEditingController();
  
  
  @override
  void initState() {
    setState(() {
      Usernamecontroller.text=widget.Username.toString();
      Phonecontroller.text=widget.Userphone.toString();
      amountcontroller.text="2000";
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: height/10.8,
        title:
        Text("Payment",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
              fontSize:width/22,
              color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff245BCA),
                    Color(0xff245BCA),
                  ]
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
          //  StepperPage(),
             SizedBox(height:height/37.8,),
            Text("Payment Form",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                  fontSize:width/22,
                  color: Colors.black),),
            SizedBox( height: height/37.8,),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: height/94.5,
                horizontal: width/45
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffffe09f)
                ),
                padding: EdgeInsets.only(left: width/36.0,right: width/36.0,top: height/37.8,bottom: height/37.8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ///Username container
                      SizedBox(
                        height: height/7.56,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Name *",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Colors.black),),
                            SizedBox(height: height/75.6,),
                            Container(
                              height: height/15.12,
                              width: width/1.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Color(0xff353535)
                                  )
                              ),
                              child: TextFormField(
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/22,
                                    color: Colors.black),
                                controller: Usernamecontroller,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                ],
                                decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(left: width/18),
                                    border: InputBorder.none,
                                    hintText: "Type Full Name",
                                    hintStyle: GoogleFonts.poppins()
                                ),
                                validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                onChanged: (_){
                                 // _formKey.currentState!.validate();
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      ///Phonenumber container
                      SizedBox(
                        height: height/7.56,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone Number *",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Colors.black),),
                            SizedBox(height: height/75.6,),
                            Container(
                              height: height/15.12,
                              width: width/1.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Color(0xff353535)
                                  )
                              ),
                              child: TextFormField(
                                readOnly: true,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/22,
                                    color: Colors.black),
                                keyboardType: TextInputType.number,
                                controller: Phonecontroller,
                                maxLength: 10,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                ],
                                decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(left: width/18),
                                    border: InputBorder.none,
                                    hintText: "Type Phone number",
                                    hintStyle: GoogleFonts.poppins()
                                ),
                                validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                onChanged: (_){
                                  // _formKey.currentState!.validate();
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      ///Amount container
                      SizedBox(
                        height: height/7.56,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Amount *",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Colors.black),),
                            SizedBox(height: height/75.6,),
                            Container(
                              height: height/15.12,
                              width: width/1.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Color(0xff353535)
                                  )
                              ),
                              child: TextFormField(
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/22,
                                    color: Colors.black),
                                keyboardType: TextInputType.number,
                                controller: amountcontroller,
                                maxLength: 10,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                ],
                                decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(left: width/18),
                                    border: InputBorder.none,
                                    hintText: "Type Amount",
                                    hintStyle: GoogleFonts.poppins()
                                ),
                                validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                onChanged: (value){
                                  if(double.parse(value.toString())<2000){
                                    awesomeDialog("Error","Minimum Amounto is Rs-2000",1);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),




                      GestureDetector(
                        onTap: (){

                          if(double.parse(amountcontroller.text)<2000){
                            awesomeDialog("Error","Minimum Amounto is Rs-2000",1);
                          }
                          else{
                            Paymentdunction();
                          }
                        },
                        child: Center(
                          child:
                          Container(
                            height: height/15.12,
                            width: width/2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff245BCA),
                                      Color(0xff245BCA),
                                    ]
                                )
                            ),
                            child: Center(
                              child:  Text("Submit",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/22,
                                    color: Colors.white),),
                            ),
                          ),
                        ),
                      )

                    ]),
              ),
            ),



          ],
        ),
      ),
    );
  }

  Paymentdunction(){
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "payment":true,
      "walletamount":double.parse(amountcontroller.text),
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const  Landing_Screen(),));

  }

  awesomeDialog(title,description,errortype){
    return AwesomeDialog(
      dismissOnBackKeyPress: errortype==3?true:false,
      dismissOnTouchOutside:errortype==3? true:false,
      context: context,
      dialogType:errortype==1? DialogType.error:errortype==2?DialogType.warning:errortype==3?DialogType.success:DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {
      },
    )..show();
  }
}
