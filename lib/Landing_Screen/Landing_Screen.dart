import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Pages/Applied_Histroy.dart';
import 'package:jp_ads/Pages/Find_Pancard.dart';
import 'package:jp_ads/Pages/Notification_Page.dart';
import 'package:jp_ads/Pages/Pancard_Link-Page.dart';
import 'package:jp_ads/Pages/Pancard_correction_Page.dart';
import 'package:jp_ads/Pages/Pandcard_apply_Page.dart';
import 'package:jp_ads/Pages/Reprint_Page.dart';
import 'package:jp_ads/Slider_Widgets/Slider_Page.dart';
import 'package:jp_ads/const_file.dart';
import 'package:jp_ads/Pages/Add walletAmount Page.dart';
import 'package:lottie/lottie.dart';

import '../Pages/Form_Page.dart';
import '../Pages/Minor_Page.dart';
import '../Pages/Referance_Video_Page.dart';

class Landing_Screen extends StatefulWidget {
  const Landing_Screen({super.key});

  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int animatesetvalue = 0;

  int histroyselect = 0;

  TabController? tabController;
  int selectTabIndex = 0;

  String userDocid="";
  int Walletamount=0;
  int notificationcount=0;
  int usgaeCount=0;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    walletamontcheckfun();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        backgroundColor: Color(0xffF2F6FF),
        body: FutureBuilder<dynamic>(
          future: FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData == null) {
              return Center(
                child: Container(),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Container(),
              );
            }

            var userdata = snapshot.data;

            return _selectedIndex == 0
                ? SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        //height:height/1.075,
                        height: height / 2.5,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xff245BCA),
                              Color(0xff245BCA),
                            ]),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(600, 110))),
                        child: Stack(
                          children: [

                            ///circle(right side)
                            Positioned(
                              left: width / 1.714,
                              top: height / 25.2,
                              child: Image.asset(
                                "assets/Ellipse 23.png",
                                height: height / 5.04,
                                width: width / 2.4,
                                fit: BoxFit.cover,
                              ),
                            ),

                            ///Eclipse-1
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 1.8, top: height / 6.3),
                              child: Image.asset("assets/Ellipse 26.png"),
                            ),

                            ///Eclipse-2
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 2.482, top: height / 15.12),
                              child: Image.asset(
                                "assets/Ellipse 26.png",
                                height: height / 25.2,
                                width: width / 12,
                                fit: BoxFit.cover,
                              ),
                            ),

                            ///circle(left side)
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 6.3, right: width / 1.5),
                              child: Image.asset(
                                "assets/Ellipse 24.png",
                                height: height / 5.04,
                                width: width / 3.60,
                                fit: BoxFit.fill,
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 12.6,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 18, right: width / 18),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      userdata["picture"] == ""
                                          ? CircleAvatar(
                                          radius: 25,
                                          foregroundImage:
                                          AssetImage(ProfileImage))
                                          : CircleAvatar(
                                          radius: 25,
                                          foregroundImage: NetworkImage(
                                              userdata["picture"]
                                                  .toString())),

                                      GestureDetector(
                                          onTap: () {

                                            notificationcountdisablefun(userdata.id);

                                          },
                                          child: Stack(
                                            alignment:
                                            Alignment.topRight,
                                            children: [
                                              Icon(
                                                Icons.notifications,
                                                color: Colors.white,
                                                weight: 50,
                                                size: width / 12,
                                              ),
                                              notificationcount ==
                                                  0
                                                  ? const SizedBox()
                                                  : Container(
                                                height:
                                                height / 42,
                                                width: width / 20,
                                                decoration: BoxDecoration(
                                                    color: Colors
                                                        .yellowAccent,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        width /
                                                            3.60)),
                                                child: Center(
                                                    child: Text(
                                                        notificationcount
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .poppins())),
                                              )
                                            ],
                                          )),
                                    
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 75.6,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 18, right: width / 18),
                                  child: Text(
                                    "Hi, ${userdata["name"].toString()}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 18,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 18, right: width / 18),
                                  child: Text(
                                    "Wallet Balance:  ₹ ${Walletamount.toString()}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 24,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 3.9,
                            left: width / 30,
                            right: width / 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              elevation: 15,
                              shadowColor: Colors.black12,
                              child: Container(
                                height: height / 1.51,
                                width: width / 1.058,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height / 50.4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Pandcard_apply_Page(
                                                            Userdocid:
                                                            userdata.id,
                                                            UserType: userdata[
                                                            'usertype'],
                                                            UserWalletamount:
                                                            Walletamount.toString(),
                                                           Usagecount:usgaeCount,
                                                        ),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        pancardapplyicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "New PAN Card\nApply",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Pancard_correction_Page(
                                                            Userdocid:
                                                            userdata.id,
                                                            UserType: userdata[
                                                            'usertype'],
                                                            UserWalletamount:
                                                            Walletamount.toString(),
                                                            Usagecount:usgaeCount
                                                        ),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        pancorrectionicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "PAN Correction\nUpdate",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Pancard_Link_Page(
                                                            Userdocid:
                                                            userdata.id,
                                                            UserType: userdata[
                                                            'usertype'],
                                                            UserWalletamount:
                                                            Walletamount.toString(),
                                                            Usagecount:usgaeCount),
                                                  ));
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 30),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: height / 15.12,
                                                    width: width / 7.2,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffD3D8E2),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            width /
                                                                3.60)),
                                                    child: Center(
                                                        child: Image.asset(
                                                          newpancardicon,
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    height: height / 75.6,
                                                  ),
                                                  Text(
                                                    " PAN-Card\n Link",
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize:
                                                        width / 30,
                                                        color: const Color(
                                                            0xff00194A)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Reprint_Page(
                                                            Userdocid:
                                                            userdata.id,
                                                            UserType: userdata[
                                                            'usertype'],
                                                            UserWalletamount:
                                                            Walletamount.toString(),
                                                            Usagecount:usgaeCount
                                                        ),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  margin: EdgeInsets.only(
                                                      right: width / 36.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        reprintpancardicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Lost,Missing \nPan Card",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {});
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Applied_Histroy(
                                                            usertype: userdata[
                                                            'usertype']),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  //   margin: EdgeInsets.only(left:width/96.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        applyedhistroyicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Applied\nHistory",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                animatesetvalue = 3;
                                                _selectedIndex = 3;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        userprofileicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "User Profile",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,

                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                  builder: (context)
                                              =>
                                                  Minor_Page(Userdocid:
                                                  userdata.id,
                                                      UserType: userdata[
                                                      'usertype'],
                                                      UserWalletamount:
                                                      Walletamount.toString(),
                                                      Usagecount:usgaeCount)
                                              ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  // margin: EdgeInsets.only(right:width/36.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        pancardapplyicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Minor \nPan Card\nApply",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              setState(() {});
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                  builder: (context)
                                              =>
                                                  Referance_Video_Page()
                                              ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  //   margin: EdgeInsets.only(left:width/96.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        Referencevc_icon,
                                                        height:height/25.2,
                                                        width:width/12,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Reference\nVideos",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                  builder: (context)=>
                                                  Form_Page()
                                              ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        Form_Icon,
                                                        height:height/25.2,
                                                        width:width/12,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Forms",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: height / 50.4),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,

                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context)
                                                      =>
                                                          Find_Pancard(Userdocid:
                                                          userdata.id,
                                                              UserType: userdata[
                                                              'usertype'],
                                                              UserWalletamount:
                                                              Walletamount.toString(),
                                                              Usagecount:usgaeCount)
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  // margin: EdgeInsets.only(right:width/36.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        pancardapplyicon,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "Find \nPan Card",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {

                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  //   margin: EdgeInsets.only(left:width/96.0),
                                                  decoration: BoxDecoration(
                                                      //color: const Color(0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                  child: Center(
                                                      child: Image.asset(
                                                        pancardapplyicon,
                                                        fit: BoxFit.cover,
                                                      )
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "FAQ",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {

                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height / 15.12,
                                                  width: width / 7.2,
                                                  decoration: BoxDecoration(
                                                   ///   color: const Color(0xffD3D8E2),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          width /
                                                              3.60)),
                                                ),
                                                SizedBox(
                                                  height: height / 75.6,
                                                ),
                                                Text(
                                                  "",
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: width / 30,
                                                      color: const Color(
                                                          0xff00194A)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height / 75.6),
                            Text(
                              Updatetext,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 20,
                                  color: Colors.black),
                            ),
                            SizedBox(height: height / 75.6),
                            SizedBox(
                              height: height / 4.5,
                              width: double.infinity,
                              child: BannerSlider(),
                            ),
                            SizedBox(height: height / 75.6),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
                : _selectedIndex == 1
                ? SizedBox(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 3.78,
                              left: width / 30,
                              right: width / 30),
                          child: SingleChildScrollView(
                            physics:
                            const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height / 6.0),
                                Text(
                                  Histroytext,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width / 20,
                                      color: Colors.black),
                                ),
                                SizedBox(height: height / 75.6),
                                TabBar(
                                  controller: tabController,
                                  labelColor: Colors.indigo,
                                  dividerColor: Colors.transparent,
                                  isScrollable: false,
                                  indicatorSize:
                                  TabBarIndicatorSize.label,
                                  indicatorColor: Colors.red,
                                  physics: BouncingScrollPhysics(),
                                  indicatorPadding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  labelPadding:
                                  const EdgeInsets.all(0),
                                  splashBorderRadius:
                                  BorderRadius.zero,
                                  splashFactory:
                                  NoSplash.splashFactory,
                                  labelStyle: GoogleFonts.openSans(
                                    fontSize: width / 25.714,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  unselectedLabelStyle:
                                  GoogleFonts.openSans(
                                    fontSize: width / 22.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  onTap: (index) {
                                    setState(() {
                                      selectTabIndex = index;
                                    });
                                  },
                                  tabs: [
                                    Tab(
                                      child: const Text("Applied"),
                                    ),
                                    Tab(
                                      child: const Text("Correction",),
                                    ),
                                    Tab(
                                      child: const Text("Wallet"),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: height / 2.6068,
                                  child: TabBarView(
                                    controller: tabController,
                                    physics:
                                    NeverScrollableScrollPhysics(),
                                    children: [
                                      FutureBuilder(
                                        future: FirebaseFirestore
                                            .instance
                                            .collection("Users")
                                            .doc(FirebaseAuth.instance
                                            .currentUser!.uid)
                                            .collection("Histroy")
                                            .orderBy(
                                            "timestamp", descending: true)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasError) {
                                            switch (snapshot
                                                .connectionState) {
                                              case ConnectionState
                                                  .none:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              case ConnectionState
                                                  .waiting:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              default:
                                                return ListView
                                                    .builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                  ScrollPhysics(),
                                                  itemCount: snapshot
                                                      .data!
                                                      .docs
                                                      .length,
                                                  itemBuilder:
                                                      (context,
                                                      index) {
                                                    var applieddata =
                                                    snapshot.data!
                                                        .docs[
                                                    index];

                                                    if (applieddata[
                                                    'Type'] ==
                                                        "Applied") {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          //name,fathername,gender,dob,pantype,updatestatus,date,time,type,aadharpicture,signpicture,photo)
                                                          Applieddetailspopup(
                                                            applieddata[
                                                            'name']
                                                                .toString(),
                                                            applieddata[
                                                            'father name']
                                                                .toString(),
                                                            applieddata[
                                                            'gender']
                                                                .toString(),
                                                            applieddata[
                                                            'dob']
                                                                .toString(),
                                                            applieddata[
                                                            'pantype']
                                                                .toString(),
                                                            applieddata[
                                                            'updatestatus']
                                                                .toString(),
                                                            applieddata[
                                                            'date']
                                                                .toString(),
                                                            applieddata[
                                                            'time']
                                                                .toString(),
                                                            applieddata[
                                                            'Type']
                                                                .toString(),
                                                            applieddata[
                                                            'aadharpicture']
                                                                .toString(),
                                                            applieddata[
                                                            'signpicture']
                                                                .toString(),
                                                            applieddata[
                                                            'photo']
                                                                .toString(),
                                                          );
                                                        },
                                                        child:
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              bottom:
                                                              8.0),
                                                          child:
                                                          Material(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                            color: Colors
                                                                .white54
                                                                .withOpacity(
                                                                0.9),
                                                            elevation:
                                                            10,
                                                            child:
                                                            Container(
                                                              height: height /
                                                                  7.56,
                                                              width: width /
                                                                  1.125,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                color: Colors
                                                                    .white54
                                                                    .withOpacity(
                                                                    0.9),
                                                              ),
                                                              child:
                                                              Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Name : ${applieddata['name']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Farther Name: ${applieddata['father name']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Date : ${applieddata['date']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Time : ${applieddata['time']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Status : ${applieddata['updatestatus']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Type : ${applieddata['Type']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: applieddata['Type']
                                                                                      .toString() ==
                                                                                      "Applied"
                                                                                      ? Colors
                                                                                      .green
                                                                                      : Colors
                                                                                      .indigo))),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return const SizedBox();
                                                  },
                                                );
                                            }
                                          }

                                          return const Center(
                                            child:
                                            CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                      FutureBuilder(
                                        future: FirebaseFirestore
                                            .instance
                                            .collection("Users")
                                            .doc(FirebaseAuth.instance
                                            .currentUser!.uid)
                                            .collection("Histroy")
                                            .orderBy(
                                            "timestamp", descending: true)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData ==
                                              null) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          }
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          }
                                          if (!snapshot.hasError) {
                                            switch (snapshot
                                                .connectionState) {
                                              case ConnectionState
                                                  .none:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              case ConnectionState
                                                  .waiting:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              default:
                                                return ListView
                                                    .builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                  ScrollPhysics(),
                                                  itemCount: snapshot
                                                      .data!
                                                      .docs
                                                      .length,
                                                  itemBuilder:
                                                      (context,
                                                      index) {
                                                    var applieddata =
                                                    snapshot.data!
                                                        .docs[
                                                    index];

                                                    if (applieddata[
                                                    'Type'] ==
                                                        "Correction") {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          detailspopup(
                                                            applieddata[
                                                            'Crtname']
                                                                .toString(),
                                                            applieddata[
                                                            'crtfathername']
                                                                .toString(),
                                                            applieddata[
                                                            'crtphonenumber']
                                                                .toString(),
                                                            applieddata[
                                                            'crgender']
                                                                .toString(),
                                                            applieddata[
                                                            'crtdate_of_birth']
                                                                .toString(),
                                                            applieddata[
                                                            'pancardno']
                                                                .toString(),
                                                            applieddata[
                                                            'crtnameandbuildsno']
                                                                .toString(),
                                                            applieddata[
                                                            'crtnadddress']
                                                                .toString(),
                                                            applieddata[
                                                            'crtdistrict']
                                                                .toString(),
                                                            applieddata[
                                                            'crtstate']
                                                                .toString(),
                                                            applieddata[
                                                            'date']
                                                                .toString(),
                                                            applieddata[
                                                            'time']
                                                                .toString(),
                                                            applieddata[
                                                            'updatestatus']
                                                                .toString(),
                                                            applieddata[
                                                            'correctionupdate']
                                                                .toString(),
                                                            applieddata[
                                                            'Type']
                                                                .toString(),
                                                            applieddata[
                                                            'crtpincode']
                                                                .toString(),
                                                          );
                                                        },
                                                        child:
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              bottom:
                                                              8.0),
                                                          child:
                                                          Material(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                            color: Colors
                                                                .white54
                                                                .withOpacity(
                                                                0.9),
                                                            elevation:
                                                            10,
                                                            child:
                                                            Container(
                                                              height: height /
                                                                  7.56,
                                                              width: width /
                                                                  1.125,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                color: Colors
                                                                    .white54
                                                                    .withOpacity(
                                                                    0.9),
                                                              ),
                                                              child:
                                                              Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Name : ${applieddata['Crtname']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Phone no: ${applieddata['crtphonenumber']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Date : ${applieddata['date']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Time : ${applieddata['time']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .spaceAround,
                                                                    children: [
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Status : ${applieddata['updatestatus']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: Colors
                                                                                      .black))),
                                                                      Container(
                                                                          height: height /
                                                                              25.2,
                                                                          width: width /
                                                                              2.4,
                                                                          child: Text(
                                                                              "Type : ${applieddata['Type']
                                                                                  .toString()}",
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  fontWeight: FontWeight
                                                                                      .w500,
                                                                                  textStyle: TextStyle(
                                                                                      overflow: TextOverflow
                                                                                          .ellipsis),
                                                                                  color: applieddata['Type']
                                                                                      .toString() ==
                                                                                      "Applied"
                                                                                      ? Colors
                                                                                      .green
                                                                                      : Colors
                                                                                      .indigo))),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return const SizedBox();
                                                  },
                                                );
                                            }
                                          }

                                          return const Center(
                                            child:
                                            CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                      FutureBuilder(
                                        future: FirebaseFirestore
                                            .instance
                                            .collection("Users")
                                            .doc(FirebaseAuth.instance
                                            .currentUser!.uid)
                                            .collection(
                                            "Wallet_Histroy")
                                            .orderBy(
                                            "timestamp", descending: true)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData ==
                                              null) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          }
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          }
                                          if (!snapshot.hasError) {
                                            switch (snapshot
                                                .connectionState) {
                                              case ConnectionState
                                                  .none:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              case ConnectionState
                                                  .waiting:
                                                return const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              default:
                                                return ListView
                                                    .builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                  ScrollPhysics(),
                                                  itemCount: snapshot
                                                      .data!
                                                      .docs
                                                      .length,
                                                  itemBuilder:
                                                      (context,
                                                      index) {
                                                    var applieddata =
                                                    snapshot.data!
                                                        .docs[
                                                    index];
                                                    return Padding(
                                                      padding: EdgeInsets
                                                          .only(
                                                          bottom:
                                                          8.0),
                                                      child: Material(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8),
                                                        color: Colors
                                                            .white54
                                                            .withOpacity(
                                                            0.9),
                                                        elevation: 10,
                                                        child:
                                                        Container(
                                                          height:
                                                          height /
                                                              7.56,
                                                          width: width /
                                                              1.125,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                            color: Colors
                                                                .white54
                                                                .withOpacity(
                                                                0.9),
                                                          ),
                                                          child:
                                                          Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Name : ${applieddata['name']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .black))),
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Phone no: ${applieddata['Phoneno']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .black))),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Date : ${applieddata['date']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .black))),
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Time : ${applieddata['time']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .black))),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Amount : ${applieddata['Amount']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .black))),
                                                                  Container(
                                                                      height: height /
                                                                          25.2,
                                                                      width: width /
                                                                          2.4,
                                                                      child: Text(
                                                                          "Type : ${userdata['usertype']
                                                                              .toString()}",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                              fontWeight: FontWeight
                                                                                  .w500,
                                                                              textStyle: TextStyle(
                                                                                  overflow: TextOverflow
                                                                                      .ellipsis),
                                                                              color: Colors
                                                                                  .green))),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                            }
                                          }

                                          return const Center(
                                            child:
                                            CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.52,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff4E82EA),
                          Color(0xff4E82EA),
                        ]),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(40),
                        //   bottomRight: Radius.circular(40),
                        // )
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(600, 110))),
                    // padding: EdgeInsets.only(left: width/18,right: width/18),
                    child: Stack(
                      children: [

                        ///circle(right side)
                        Positioned(
                          left: width / 1.714,
                          top: height / 25.2,
                          child: Image.asset(
                            "assets/Ellipse 23.png",
                            height: height / 5.04,
                            width: width / 2.4,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///Eclipse-1
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 1.8, top: height / 6.3),
                          child: Image.asset("assets/Ellipse 26.png"),
                        ),

                        ///Eclipse-2
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 2.482,
                              top: height / 15.12),
                          child: Image.asset(
                            "assets/Ellipse 26.png",
                            height: height / 25.2,
                            width: width / 12,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///circle(left side)
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 6.3, right: width / 1.5),
                          child: Image.asset(
                            "assets/Ellipse 24.png",
                            height: height / 5.04,
                            width: width / 3.60,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 12.6,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 18,
                                  right: width / 18),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  userdata["picture"] == ""
                                      ? CircleAvatar(
                                      radius: 25,
                                      foregroundImage: AssetImage(
                                          ProfileImage))
                                      : CircleAvatar(
                                      radius: 25,
                                      foregroundImage:
                                      NetworkImage(
                                          userdata["picture"]
                                              .toString())),
                                  GestureDetector(
                                      onTap: () {

                                        notificationcountdisablefun(userdata.id);

                                      },
                                      child: Stack(
                                        alignment:
                                        Alignment.topRight,
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            weight: 50,
                                            size: width / 12,
                                          ),
                                          notificationcount ==
                                              0
                                              ? const SizedBox()
                                              : Container(
                                            height:
                                            height / 42,
                                            width: width / 20,
                                            decoration: BoxDecoration(
                                                color: Colors
                                                    .yellowAccent,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    width /
                                                        3.60)),
                                            child: Center(
                                                child: Text(
                                                    notificationcount
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .poppins())),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 37.8,
                            ),

                            Text(
                              "History",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 12,
                                  color: Colors.white),
                            ),

                            Text(
                              "Wallet Balance : ₹ ${Walletamount.toString()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24,
                                  color: const Color(0xffDAE2F2)),
                            ),
                            // SizedBox(height:10),
                            // Container(
                            //   height: height/15.12,
                            //   width: width/1.565,
                            //   decoration: BoxDecoration(
                            //     color:Color(0xffF8A700),
                            //     borderRadius: BorderRadius.circular(8)
                            //   ),
                            //   child: Center(
                            //     child: Text("+  Add Amount",
                            //       textAlign: TextAlign.center,
                            //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            //           fontSize: width/18,
                            //           color: Colors.white),),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : _selectedIndex == 2
                ? SizedBox(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 3.78,
                              left: width / 30,
                              right: width / 30),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height / 6.0),
                              Text(
                                Transactionstext,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 20,
                                    color: Colors.black),
                              ),

                              SizedBox(height: height / 75.6),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(FirebaseAuth.instance
                                    .currentUser!.uid)
                                    .collection("Wallet_Histroy").orderBy(
                                    "timestamp", descending: true)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData == null) {
                                    return const Center(
                                      child:
                                      CircularProgressIndicator(),
                                    );
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child:
                                      CircularProgressIndicator(),
                                    );
                                  }

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                    NeverScrollableScrollPhysics(),
                                    itemCount: snapshot
                                        .data!.docs.length,
                                    itemBuilder:
                                        (context, index) {
                                      var applieddata = snapshot
                                          .data!.docs[index];

                                      return Padding(
                                        padding:
                                        EdgeInsets.all(8.0),
                                        child: Material(
                                          borderRadius:
                                          BorderRadius
                                              .circular(8),
                                          color: Colors.white54
                                              .withOpacity(0.9),
                                          elevation: 10,
                                          child: Container(
                                            height:
                                            height / 7.56,
                                            width:
                                            width / 1.125,
                                            decoration:
                                            BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  8),
                                              color: Colors
                                                  .white54
                                                  .withOpacity(
                                                  0.9),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Container(
                                                        height: height /
                                                            25.2,
                                                        width: width /
                                                            2.4,
                                                        child: Text(
                                                            "Name : ${applieddata['name']
                                                                .toString()}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                textStyle: TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis),
                                                                color: Colors
                                                                    .black))),
                                                    Container(
                                                        height: height /
                                                            25.2,
                                                        width: width /
                                                            2.4,
                                                        child: Text(
                                                            "Phone no: ${applieddata['Phoneno']
                                                                .toString()}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                textStyle: TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis),
                                                                color: Colors
                                                                    .black))),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Container(
                                                        height: height /
                                                            25.2,
                                                        width: width /
                                                            2.4,
                                                        child: Text(
                                                            "Date : ${applieddata['date']
                                                                .toString()}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                textStyle: TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis),
                                                                color: Colors
                                                                    .black))),
                                                    Container(
                                                        height: height /
                                                            25.2,
                                                        width: width /
                                                            2.4,
                                                        child: Text(
                                                            "Time : ${applieddata['time']
                                                                .toString()}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                fontWeight: FontWeight
                                                                    .w500,
                                                                textStyle: TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis),
                                                                color: Colors
                                                                    .black))),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: width /
                                                              72),
                                                      child: Container(
                                                          height: height /
                                                              25.2,
                                                          width: width /
                                                              1.2,
                                                          child: Text(
                                                              "Transcation Amount : ${applieddata['Amount']
                                                                  .toString()}",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                  fontWeight: FontWeight
                                                                      .w500,
                                                                  textStyle: TextStyle(
                                                                      overflow: TextOverflow
                                                                          .ellipsis),
                                                                  color: Colors
                                                                      .black))),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),

                              // Text(EmptyTransactionstext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                              //     fontSize: width/30,
                              //     color: Color(0xff8C8994)),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.52,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff4E82EA),
                          Color(0xff4E82EA),
                        ]),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(600, 110))),
                    // padding: EdgeInsets.only(left: width/18,right: width/18),
                    child: Stack(
                      children: [

                        ///circle(right side)
                        Positioned(
                          left: width / 1.714,
                          top: height / 25.2,
                          child: Image.asset(
                            "assets/Ellipse 23.png",
                            height: height / 5.04,
                            width: width / 2.4,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///Eclipse-1
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 1.8,
                              top: height / 6.3),
                          child: Image.asset(
                              "assets/Ellipse 26.png"),
                        ),

                        ///Eclipse-2
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 2.482,
                              top: height / 15.12),
                          child: Image.asset(
                            "assets/Ellipse 26.png",
                            height: height / 25.2,
                            width: width / 12,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///circle(left side)
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 6.3,
                              right: width / 1.5),
                          child: Image.asset(
                            "assets/Ellipse 24.png",
                            height: height / 5.04,
                            width: width / 3.60,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 12.6,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 18,
                                  right: width / 18),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  userdata["picture"] == ""
                                      ? CircleAvatar(
                                      radius: 25,
                                      foregroundImage:
                                      AssetImage(
                                          ProfileImage))
                                      : CircleAvatar(
                                      radius: 25,
                                      foregroundImage:
                                      NetworkImage(userdata[
                                      "picture"]
                                          .toString())),
                                  GestureDetector(
                                      onTap: () {

                                        notificationcountdisablefun(userdata.id);

                                      },
                                      child: Stack(
                                        alignment:
                                        Alignment.topRight,
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            weight: 50,
                                            size: width / 12,
                                          ),
                                          notificationcount ==
                                              0
                                              ? const SizedBox()
                                              : Container(
                                            height:
                                            height / 42,
                                            width: width / 20,
                                            decoration: BoxDecoration(
                                                color: Colors
                                                    .yellowAccent,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    width /
                                                        3.60)),
                                            child: Center(
                                                child: Text(
                                                    notificationcount
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .poppins())),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Text(
                              "Wallet",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 12,
                                  color: Colors.white),
                            ),
                            Text(
                              "Current Balance",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24,
                                  color: Colors.white),
                            ),
                            Text(
                              "₹ ${Walletamount.toString()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24,
                                  color: const Color(0xffDAE2F2)),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          addwallet_Amount_Page(
                                              userdata.id),
                                    ));
                              },
                              child: Container(
                                height: height / 15.12,
                                width: width / 1.565,
                                decoration: BoxDecoration(
                                    color:
                                    const Color(0xffF8A700),
                                    borderRadius:
                                    BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    "+  Add Amount",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: width / 18,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : _selectedIndex == 3
                ? SizedBox(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 2.4,
                              left: width / 30,
                              right: width / 30),
                          child: SizedBox(
                            height: height / 1.575,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                      animatesetvalue = 0;
                                    });
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              Homeicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Home",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Applied_Histroy(
                                                  usertype:
                                                  userdata[
                                                  'usertype']),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              applyedhistroyicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Apply PAN Histroy ",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 2;
                                      animatesetvalue = 2;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              walleticon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Wallet",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Pandcard_apply_Page(
                                                  Userdocid:
                                                  userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount
                                              ),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              pancardapplyicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Apply PAN Card",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Pancard_correction_Page(
                                                  Userdocid:
                                                  userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              pancorrectionicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Correction PAN Card",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Reprint_Page(
                                                  Userdocid:
                                                  userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount
                                              ),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              reprintpancardicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Re- Print PAN Card ",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Pancard_Link_Page(Userdocid:
                                              userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              newpancardicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "PAN Card Link",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Minor_Page(Userdocid:
                                              userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              newpancardicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Minor PAN Card Apply",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Find_Pancard(Userdocid:
                                              userdata.id,
                                                  UserType: userdata[
                                                  'usertype'],
                                                  UserWalletamount:
                                                  Walletamount.toString(),
                                                  Usagecount:usgaeCount),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                        height / 15.12,
                                        width: width / 7.2,
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffD3D8E2),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                100)),
                                        child: Center(
                                            child:
                                            Image.asset(
                                              newpancardicon,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width / 15.6,
                                      ),
                                      Text(
                                        "Find PAN Card ",
                                        textAlign:
                                        TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            fontSize:
                                            width / 22,
                                            color: const Color(
                                                0xff00194A)),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.52,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff4E82EA),
                          Color(0xff4E82EA),
                        ]),
                        borderRadius: BorderRadius.vertical(
                            bottom:
                            Radius.elliptical(600, 110))),
                    // padding: EdgeInsets.only(left: width/18,right: width/18),
                    child: Stack(
                      children: [

                        ///circle(right side)
                        Positioned(
                          left: width / 1.714,
                          top: height / 25.2,
                          child: Image.asset(
                            "assets/Ellipse 23.png",
                            height: height / 5.04,
                            width: width / 2.4,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///Eclipse-1
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 1.8,
                              top: height / 6.3),
                          child: Image.asset(
                              "assets/Ellipse 26.png"),
                        ),

                        ///Eclipse-2
                        Padding(
                          padding: EdgeInsets.only(
                              left: width / 2.482,
                              top: height / 15.12),
                          child: Image.asset(
                            "assets/Ellipse 26.png",
                            height: height / 25.2,
                            width: width / 12,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///circle(left side)
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 6.3,
                              right: width / 1.5),
                          child: Image.asset(
                            "assets/Ellipse 24.png",
                            height: height / 5.04,
                            width: width / 3.60,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 12.6,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 18,
                                  right: width / 18),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  userdata["picture"] == ""
                                      ? CircleAvatar(radius: 25, foregroundImage:
                                      AssetImage(ProfileImage))
                                      : CircleAvatar(radius: 25, foregroundImage:
                                  NetworkImage(userdata["picture"].toString())),
                                  GestureDetector(
                                      onTap: () {

                                        notificationcountdisablefun(userdata.id);

                                      },
                                      child: Stack(
                                        alignment:
                                        Alignment.topRight,
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            weight: 50,
                                            size: width / 12,
                                          ),
                                          notificationcount ==
                                              0
                                              ? const SizedBox()
                                              : Container(
                                            height:
                                            height / 42,
                                            width: width / 20,
                                            decoration: BoxDecoration(
                                                color: Colors
                                                    .yellowAccent,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    width /
                                                        3.60)),
                                            child: Center(
                                                child: Text(
                                                    notificationcount
                                                        .toString(),
                                                    style: GoogleFonts
                                                        .poppins())),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Text(
                              "Profile",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width / 12,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              userdata['name'].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 18,
                                  color: Colors.white),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Type : ${userdata['usertype'].toString()}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight:
                                    FontWeight.w500,
                                    fontSize: width / 25,
                                    color: Color(0xff4E82EA)),
                              ),
                            ),
                            Text(
                              "Wallet Balance : ₹ ${Walletamount
                                  .toString()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24,
                                  color: const Color(
                                      0xffDAE2F2)),
                            ),
                            Text(
                              "+91 ${userdata['phone'].toString()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24,
                                  color: const Color(
                                      0xffDAE2F2)),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : const SizedBox();
          },
        ),
        bottomNavigationBar: Material(
          color: const Color(0xffFFFFFF),
          shadowColor: Colors.black38,
          elevation: 400,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: AnimatedContainer(
            height: height / 14.82,
            duration: const Duration(seconds: 1),
            decoration: const BoxDecoration(
              //color: Color(0xffFFFFFF),
                borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(150, 60))
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 94.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                            animatesetvalue = 0;
                          });
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              Homeicon, height: height / 30.24,
                              width: width / 14.4,
                              // color: animatesetvalue==0?Color(0xff00194A):
                              // Color(0xffA0A0A0)
                            ),
                            Text(
                              "Home",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 30,
                                  color: animatesetvalue == 0
                                      ? const Color(0xff00194A)
                                      : const Color(0xffA0A0A0)),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                            animatesetvalue = 1;
                          });
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Image.asset(applyedhistroyicon,
                                height: height / 30.24, width: width / 14.4),
                            Text("History",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 30,
                                    color: animatesetvalue == 1
                                        ? const Color(0xff00194A)
                                        : const Color(0xffA0A0A0)))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                            animatesetvalue = 2;
                          });
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Image.asset(walleticon,
                                height: height / 30.24, width: width / 14.4),
                            Text("Wallet",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 30,
                                    color: animatesetvalue == 2
                                        ? const Color(0xff00194A)
                                        : const Color(0xffA0A0A0)))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                            animatesetvalue = 3;
                          });
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Color(0xff4E82EA),
                            ),
                            Text("Profile",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 30,
                                    color: animatesetvalue == 3
                                        ? const Color(0xff00194A)
                                        : const Color(0xffA0A0A0)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  height: height / 252,
                  width: width / 8,
                  margin: EdgeInsets.only(
                      left: animatesetvalue == 0
                          ? width / 18
                          : animatesetvalue == 1
                          ? width / 3.272
                          : animatesetvalue == 2
                          ? width / 1.756
                          : animatesetvalue == 3
                          ? width / 1.241
                          : 0),
                  color: const Color(0xff245BCA),
                )
              ],
            ),
          ),
        ));
  }


  detailspopup(name,
      fathermname,
      phonenumber,
      gender,
      dob,
      panno,
      namebuildno,
      address,
      district,
      state,
      date,
      time,
      status,
      correctionlist,
      type,
      pincode) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: width / 18,
              right: width / 18,
              top: height / 18.9,
              bottom: height / 18.9),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white54.withOpacity(0.9),
            elevation: 10,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              height: height / 1.26,
              width: width / 1.125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white54.withOpacity(0.9),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 151.2,
                  ),
                  Text("Correction Details",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              overflow: TextOverflow.ellipsis),
                          color: Colors.black)),
                  SizedBox(
                    height: height / 151.2,
                  ),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Name : ${name}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Father Name : ${fathermname}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Phone no: ${phonenumber}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Gender: ${gender}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("DOB: ${dob}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Type: ${type}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Pan No: ${panno}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Name/Building No: ${namebuildno}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Address: ${address}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("District: ${district}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("State: ${state}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Pin Code: ${pincode}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Date/Time: ${date}-${time}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Status: ${status}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      width: width / 1.285,
                      child: Text(
                          "Correction List:\n ${correctionlist.toString()}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                  SizedBox(
                    height: height / 25.2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 25.2,
                      width: width / 3.60,
                      decoration: BoxDecoration(
                          color: Color(0xff263646),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Okay",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Applieddetailspopup(name, fathername, gender, dob, pantype, updatestatus,
      date, time, type, aadharpicture, signpicture, photo) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: width / 18,
              right: width / 18,
              top: height / 9.45,
              bottom: height / 9.45),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white54.withOpacity(0.9),
            elevation: 10,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              height: height / 1.89,
              width: width / 1.125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white54.withOpacity(0.9),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 151.2,
                  ),
                  Text("Applied Details",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              overflow: TextOverflow.ellipsis),
                          color: Colors.black)),
                  SizedBox(
                    height: height / 151.2,
                  ),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Name : ${name}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Father Name : ${fathername}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Date/Time: ${date}-${time}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Gender: ${gender}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("DOB: ${dob}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Pantype: ${pantype}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Status: ${updatestatus}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Date/Time: ${date}-${time}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  Container(
                      height: height / 25.2,
                      width: width / 1.285,
                      child: Text("Type: ${type}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              textStyle:
                              TextStyle(overflow: TextOverflow.ellipsis),
                              color: Colors.black))),
                  SizedBox(
                    height: height / 25.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: height / 9.45,
                        width: width / 4.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(aadharpicture))),
                      ),
                      Container(
                        height: height / 9.45,
                        width: width / 4.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(signpicture))),
                      ),
                      Container(
                        height: height / 9.45,
                        width: width / 4.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(photo))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 25.2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 25.2,
                      width: width / 3.60,
                      decoration: BoxDecoration(
                          color: Color(0xff263646),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Okay",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  notificationcountdisablefun(Userdocid)async{
    print(Userdocid);
    print("Userdocid");
    var data=await FirebaseFirestore.instance.collection("Users").doc(Userdocid).
    collection("Notification").get();
    for(int i=0;i<data.docs.length;i++){
      print("I value $i");
      FirebaseFirestore.instance.collection("Users").doc(Userdocid).
      collection("Notification").doc(data.docs[i].id).update({
        "isviewed":true
      });

    }
    setState(() {

    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Notification_Page(
                  Userdocid: Userdocid),
        ));
  }


  walletamontcheckfun()async{
    print(FirebaseAuth.instance.currentUser!.uid);

    // }

    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots().listen((event)
    {
      if(event['usertype']=="Individual"){
        if(event['usageccount']==3){
          return  awesomeDialog("Warning....!", "Exist Your Free Apply");
        }
      }
      if(event['walletamount']<=157){
        print("Entreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        awesomeDialog("Wallet amount Less","Your Wallet amount is Low  Kindly Recharge Your Wallet ");
      }
      setState(() {
        Walletamount=event['walletamount'];
        usgaeCount=event['usageccount'];
      });
    });

    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notification").where("isviewed", isEqualTo: false)
        .snapshots().listen((event) { 
          setState(() {
            notificationcount=event.docs.length;
          });
    });
    
    print("notificationcountttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
    print(notificationcount);
    print(Walletamount);
    print(usgaeCount);
  }

  awesomeDialog(title,description){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {},
    )..show();
  }



}
