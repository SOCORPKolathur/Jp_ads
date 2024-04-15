import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Pages/Notification_Page.dart';
import 'package:jp_ads/const_file.dart';

class User_Profile_Page extends StatefulWidget {
String name;
String phone;
String walletamount;
String userid;
User_Profile_Page({required this.name, required this.phone, required this.walletamount, required this.userid});

  @override
  State<User_Profile_Page> createState() => _User_Profile_PageState();
}

class _User_Profile_PageState extends State<User_Profile_Page> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor:  Color(0xffF2F6FF),
      // appBar: AppBar(
      //   backgroundColor: Color(0xffF2F6FF),
      //   elevation: 0,
      //   toolbarHeight: 70,
      //   title: Text("Profile",
      //     textAlign: TextAlign.center,
      //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
      //         fontSize:width/22,
      //         color: Colors.white),),
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.only(
      //           bottomRight: Radius.circular(20),
      //           bottomLeft: Radius.circular(20),
      //         ),
      //         gradient: LinearGradient(
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //             colors: [
      //               Color(0xff8224CA),
      //               Color(0xff84E82EA)
      //             ]
      //         )
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [

                Padding(
                  padding:  EdgeInsets.only(top:height/2.4,left: width/30,right: width/30),
                  child: SizedBox(
                    height: 480,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(Homeicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Home",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(applyedhistroyicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Apply PAN Histroy ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(walleticon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Wallet",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(pancardapplyicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Apply PAN Card",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(pancorrectionicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Correction PAN Card",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(reprintpancardicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("Re- Print PAN Card ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height:height/15.12,
                              width:width/7.2,
                              decoration: BoxDecoration(
                                  color: Color(0xffD3D8E2),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(child: Image.asset(newpancardicon,fit: BoxFit.cover,)),
                            ),
                            SizedBox(width:width/15.6,),
                            Text("PAN Card Link",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/22,
                                  color: Color(0xff00194A)),)

                          ],
                        ),

                        SizedBox(height:20),



                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            height: height/2.52,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff4E82EA),
                      Color(0xff4E82EA),
                    ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
            ),
            // padding: EdgeInsets.only(left: width/18,right: width/18),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height/12.6,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: width/18,right: width/18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            foregroundImage: AssetImage(ProfileImage),
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Page(),));
                              },
                              child: Icon(Icons.notifications,color: Colors.white,))

                        ],
                      ),
                    ),

                    Text("Profile",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                        fontSize: width/12,
                        color: Colors.white),),

                    SizedBox(height:15),
                    Text("Raja",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize: width/18,
                          color: Colors.white),),
                    Text("Wallet Balance : ${"₹ 500"}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize: width/24,
                          color: Color(0xffDAE2F2)),),

                    Text("+91${"995230177"}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize: width/24,
                          color: Color(0xffDAE2F2)),),
                    SizedBox(height:10),


                  ],
                ),

                ///circle(right side)
                Positioned(
                  left: width/1.714,top: height/25.2,
                  child: Image.asset("assets/Ellipse 23.png",height: height/5.04,
                    width: width/2.4,
                    fit: BoxFit.cover,),
                ),
                ///Eclipse-1
                Padding(
                  padding:  EdgeInsets.only(left: width/1.8,top: height/6.3),
                  child: Image.asset("assets/Ellipse 26.png"),
                ),
                ///Eclipse-2
                Padding(
                  padding:  EdgeInsets.only(left: width/2.482,top:height/15.12),
                  child: Image.asset("assets/Ellipse 26.png",height: height/25.2,width: width/12,fit: BoxFit.cover,),
                ),
                ///circle(left side)
                Padding(
                  padding: EdgeInsets.only(  top: height/6.3,right: width/1.5),

                  child: Image.asset("assets/Ellipse 24.png",height: height/5.04,
                    width: width/3.60,
                    fit: BoxFit.fill,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
