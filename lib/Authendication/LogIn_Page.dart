import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Authendication/Otp_Page.dart';
import 'package:jp_ads/const_file.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class LogIn_Page extends StatefulWidget {


  @override
  State<LogIn_Page> createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {

  TextEditingController Usernamecontrolller=TextEditingController();
  TextEditingController Userphonenumbercontrolller=TextEditingController();

  int radiovalue=1;

  String  UserType=Indiviaultxt;
  File ?_photo1;
  String imageUrl="";
  bool Loading=false;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height:double.infinity,
        child:
        Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height:height/1,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height/12.6,
                                width: width/6,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/Logo (2).png")
                                    )
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("JP Ads",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,
                                      fontSize: width/8.4,
                                      color: Colors.white),),
                                  Text(Quotes,style: GoogleFonts.poppins(
                                      fontSize: width/26.5,
                                      color: Colors.white),),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: height/15.56,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           Radio(value: 1,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: radiovalue,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                               onChanged: (val){
                             setState(() {
                               radiovalue=val!;
                               UserType=Indiviaultxt;
                             });
                             print(UserType);
                               }),
                              Text(Indiviaultxt,style: GoogleFonts.poppins(
                                  fontSize: width/26.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),),
                           SizedBox(width: width/12,),

                           Radio(
                               value: 2,
                               groupValue: radiovalue,
                               activeColor: Colors.white,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                               focusColor: Colors.white,
                               onChanged: (val){
                                 setState(() {
                                   radiovalue=val!;
                                   UserType=Distributetxt;
                                 });
                                 print(UserType);
                               }),
                              Text(Distributetxt,style: GoogleFonts.poppins(
                                  fontSize: width/26.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),),

                            ],
                          ),
                          SizedBox(height: height/25.56,),

                          UserType==Distributetxt? GestureDetector(
                            onTap: (){
                              _uploadImage();
                            },
                            child: SizedBox(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Material(
                                    shadowColor: Colors.black12,
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    elevation: 15,
                                    child: Container(
                                      height:height/7.56,
                                      width:width/3.60,
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      image: _photo1==null?
                                      DecorationImage(
                                        image: AssetImage(loginprofileimg)
                                      ):DecorationImage(image: FileImage(_photo1!))
                                     ),
                                    // child:
                                    // _photo1==null?
                                    // Image.asset(loginprofileimg,height: height/9.45,width: width/4.5):
                                    // Image.file(_photo1!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),
                                    ),
                                  ),
                                  Material(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey.shade500,
                                    shadowColor: Colors.black12,
                                    elevation: 20,
                                    child: Container(
                                        height:height/21.6,
                                        width: width/10.285,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.grey.shade500
                                        ),
                                        child: Icon(Icons.edit,color: Colors.white,size: width/20,)),
                                  )
                                ],
                              ),
                            ),
                          ):const SizedBox(),

                          SizedBox(height: height/25.56,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.only(left: width/72,right: width/120,top: height/151.2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text("User name",style: GoogleFonts.poppins(
                                        fontSize:width/28.714,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff245BCA)),),
                                  ],
                                ),
                                TextField(
                                  controller: Usernamecontrolller,
                                  style: GoogleFonts.poppins(
                                      fontSize:width/28.714,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.person,color:  Color(0xffF8A700),)
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height:height/30.12,),

                          Container(
                            decoration: BoxDecoration(
                               color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.only(left: width/72,right: width/120,top: height/151.2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text("Phone Number",
                                      style: GoogleFonts.poppins(
                                        fontSize:width/28.714,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff245BCA)),),
                                  ],
                                ),
                                TextField(
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.poppins(
                                      fontSize:width/28.714,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  controller: Userphonenumbercontrolller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                      prefixIcon: Icon(Icons.phone,color: Color(0xffF8A700),)
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height:height/15.12,),

                        GestureDetector(
                            onTap: (){
                              setState(() {
                                Loading=true;
                              });
                              if(UserType==Distributetxt){
                                firebasestroragefunctionphoto();
                              }
                              else{
                              Future.delayed(Duration(seconds: 2),(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_Page(
                                    phonenumber: Userphonenumbercontrolller.text,
                                    Username: Usernamecontrolller.text,
                                    UserType:UserType,
                                    imageUrl:imageUrl

                                ),));
                                setState(() {
                                  Loading=false;
                                });
                              });
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
                                  child: Text("Sign in",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                      fontSize: width/22.5,
                                      color: Colors.black),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:height/15.12,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Loading==true?
            Container(
              height:160,
              width:160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please Wait...",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                        fontSize:width/22,
                        color: Colors.black),),
                  SizedBox(height:10),
                  CircularProgressIndicator(
                    color: Color(0xff263646),
                    strokeWidth: 5,
                  ),
                ],
              ),
            )
                :const SizedBox()
          ],
        ),
      ),
    );
  }

  _uploadImage() async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo1 = File(value.path);
        });
      }
    });
  }

  firebasestroragefunctionphoto() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo1.jpg");
    var uploadTask = await ref.putFile(_photo1!).catchError((error) async {

    });
    var image = await uploadTask.ref.getDownloadURL();
    setState(() {
      imageUrl=image;
    });
    if(imageUrl!=null){
      setState(() {
        Loading=false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_Page(
          phonenumber: Userphonenumbercontrolller.text,
          Username: Usernamecontrolller.text,
          UserType:UserType,
          imageUrl:imageUrl

      ),));
    }

  }

}
