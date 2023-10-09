import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Pages/Applied_Histroy.dart';
import 'package:jp_ads/Pages/Notification_Page.dart';
import 'package:jp_ads/Pages/Pancard_Link-Page.dart';
import 'package:jp_ads/Pages/Pancard_correction_Page.dart';
import 'package:jp_ads/Pages/Pandcard_apply_Page.dart';
import 'package:jp_ads/Pages/Reprint_Page.dart';
import 'package:jp_ads/Pages/User_Profile_Page.dart';
import 'package:jp_ads/Slider_Widgets/Slider_Page.dart';
import 'package:jp_ads/const_file.dart';
import 'package:jp_ads/Pages/Add walletAmount Page.dart';

class Landing_Screen extends StatefulWidget {
  const Landing_Screen({super.key});

  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen> {

  int _selectedIndex=0;
  int animatesetvalue=0;




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      body: FutureBuilder<dynamic>(
        future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (context, snapshot) {

          if(snapshot.hasData==null){
            return Center(child: Container(),);
          }

          if(!snapshot.hasData){
            return Center(child: Container(),);
          }

          var userdata=snapshot.data;

          return _selectedIndex==0?
          Column(
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                      //height: double.infinity,
                      height:height/1.1,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff245BCA),
                                Color(0xff245BCA),
                              ]
                          ),
                          // borderRadius: BorderRadius.only(
                          //   bottomLeft: Radius.circular(40),
                          //   bottomRight: Radius.circular(40),
                          // )
                      ),
                      child: Stack(
                        children: [


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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height/12.6,
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: width/18,right: width/18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    userdata["picture"]==""?
                                    CircleAvatar(
                                      radius: 25,
                                     foregroundImage: AssetImage(ProfileImage)):
                                    CircleAvatar(
                                      radius: 25,
                                     foregroundImage: NetworkImage(userdata["picture"].toString())),
                                    GestureDetector(
                                        onTap: (){
                                          print("Notification");
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Page(),));
                                        },
                                        child: Icon(Icons.notifications,color: Colors.white,
                                          weight: 50,

                                        ))

                                  ],
                                ),
                              ),
                              SizedBox(
                                height:height/75.6,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width/18,right: width/18),
                                child: Text("Hi, ${userdata["name"].toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                    fontSize: width/18,
                                    color: Colors.white),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width/18,right: width/18),
                                child: Text("Wallet Balance:  ₹ ${userdata["walletamount"].toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize: width/24,
                                    color: Colors.white),),
                              ),







                            ],
                          ),






                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top:height/3.9,left: width/30,right: width/30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          elevation: 15,
                          shadowColor: Colors.black12,
                          child: Container(
                            height: height/2.7,
                            width: width/1.058,
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(top: height/50.4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pandcard_apply_Page(),));
                                        },
                                        child: Column(
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
                                            SizedBox(height:height/75.6,),
                                            Text("New PAN Card\nApply",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

                                          ],
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pancard_correction_Page(),));
                                        },
                                        child: Column(
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
                                            SizedBox(height:height/75.6,),
                                            Text("PAN Correction\nUpdate",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

                                          ],
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pancard_Link_Page(),));
                                        },
                                        child: Column(
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
                                            SizedBox(height:height/75.6,),
                                            Text(" PAN-Card\n Link",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(bottom: height/50.4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Reprint_Page(),));
                                        },
                                        child: Column(
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
                                            SizedBox(height:height/75.6,),
                                            Text("Reprint PAN\nCard",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

                                          ],
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Applied_Histroy(),));
                                        },
                                        child: Column(
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
                                            SizedBox(height:height/75.6,),
                                            Text("Applied\nHistory",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

                                          ],
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap:(){
                                          setState((){
                                            animatesetvalue=3;
                                            _selectedIndex=3;
                                          });
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => User_Profile_Page(
                                          //     name:  userdata['name'].toString(),
                                          //   userdata['name'].toString(),
                                          //   userdata['name'].toString(),
                                          // ),
                                          // ));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height:height/15.12,
                                              width:width/7.2,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffD3D8E2),
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Center(child: Image.asset(userprofileicon,fit: BoxFit.cover,)),
                                            ),
                                            SizedBox(height:height/75.6,),
                                            Text("User Profile",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                  fontSize:width/30,
                                                  color: Color(0xff00194A)),)

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
                        SizedBox(height:height/75.6),

                        Text(Updatetext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                            fontSize: width/20,
                            color: Colors.white),),

                        SizedBox(height:height/75.6),

                        Container(
                          height: height /4.5,
                          width: double.infinity,
                          child: BannerSlider(),
                        ),
                        SizedBox(height:height/75.6),


                      ],
                    ),
                  )
                ],
              ),

            ],
          ):
          _selectedIndex==1?
          Column(
            children: [
              Stack(
                children: [
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
                                  userdata["picture"]==""?
                                  CircleAvatar(
                                      radius: 25,
                                      foregroundImage: AssetImage(ProfileImage)):
                                  CircleAvatar(
                                      radius: 25,
                                      foregroundImage: NetworkImage(userdata["picture"].toString())),
                                  GestureDetector(
                                      onTap: (){

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Page(),));

                                      },
                                      child: Icon(Icons.notifications,color: Colors.white,))

                                ],
                              ),
                            ),
                            SizedBox(height: 20,),

                            Text("History",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                fontSize: width/12,
                                color: Colors.white),),

                            Text("Wallet Balance : ₹ ${userdata['walletamount'].toString()}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize: width/24,
                                  color: Color(0xffDAE2F2)),),
                            // SizedBox(height:10),
                            // Container(
                            //   height: 50,
                            //   width: 230,
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

                  Padding(
                    padding:  EdgeInsets.only(top:height/3.78,left: width/30,right: width/30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:height/6.0),
                        Text(Histroytext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                            fontSize: width/20,
                            color: Colors.black),),

                        SizedBox(height:height/75.6),
                       StreamBuilder(stream: FirebaseFirestore.instance.collection("Users").doc(userdata.id.toString()).collection("Histroy").snapshots(),
                           builder:
                       (context, snapshot) {
                         if(snapshot.hasData==null){
                           return Center(child: CircularProgressIndicator(),);
                         }
                         if(!snapshot.hasData){
                           return Center(child: CircularProgressIndicator(),);
                         }
                         if(snapshot.data!.docs.length==0){
                           return Center(child:  Text("You Have No history yet",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                               fontSize: width/30,
                               color: Color(0xff8C8994)),),);
                         }

                         return ListView.builder(
                           shrinkWrap: true,
                           physics: BouncingScrollPhysics(),
                           itemCount: snapshot.data!.docs.length,
                           itemBuilder: (context, index) {

                             var Histroydata=snapshot.data!.docs[index];




                           return
                             Container(
                               padding: EdgeInsets.only(top: 10),
                               decoration: BoxDecoration(
                                   color: Colors.grey.shade200,
                                   borderRadius: BorderRadius.circular(8)
                               ),
                               child: ListTile(
                               title: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     width:235,
                                     child: Text(Histroydata['title'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                         fontSize: width/30,
                                         color: Color(0xff8C8994)),),
                                   ),
                                   Column(
                                     children: [
                                       Text(Histroydata['date'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                           fontSize: width/30,
                                           color: Color(0xff8C8994)),),
                                       Text(Histroydata['time'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                           fontSize: width/30,
                                           color: Color(0xff8C8994)),),
                                     ],
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                   ),
                                 ],
                               ),
                               subtitle:
                               SizedBox(
                                 height: 60,
                                 width: 250,
                                 child: Text("Content : ${Histroydata['content'].toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                     textStyle: TextStyle(
                                       overflow: TextOverflow.ellipsis
                                     ),
                                     fontSize: width/30,
                                     color: Color(0xff8C8994)),),
                               ),
                           ),
                             );
                         },);
                       },),



                      ],
                    ),
                  )
                ],
              ),

            ],
          ):
          _selectedIndex==2?
          Column(
            children: [
              Stack(
                children: [
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
                                  userdata["picture"]==""?
                                  CircleAvatar(
                                      radius: 25,
                                      foregroundImage: AssetImage(ProfileImage)):
                                  CircleAvatar(
                                      radius: 25,
                                      foregroundImage: NetworkImage(userdata["picture"].toString())),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Page(),));
                                      },
                                      child: Icon(Icons.notifications,color: Colors.white,))

                                ],
                              ),
                            ),

                            Text("Wallet",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                fontSize: width/12,
                                color: Colors.white),),

                            Text("Current Balance",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize: width/24,
                                  color: Colors.white),),

                            Text("₹ ${userdata['walletamount']}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize: width/24,
                                  color: Color(0xffDAE2F2)),),
                            SizedBox(height:10),
                            GestureDetector(

                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => addwallet_Amount_Page(userdata.id),));
                              },
                              child: Container(
                                height: 50,
                                width: 230,
                                decoration: BoxDecoration(
                                    color:Color(0xffF8A700),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text("+  Add Amount",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        fontSize: width/18,
                                        color: Colors.white),),
                                ),
                              ),
                            ),








                          ],
                        ),






                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top:height/3.78,left: width/30,right: width/30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:height/6.0),
                        Text(Transactionstext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                            fontSize: width/20,
                            color: Colors.black),),

                        SizedBox(height:height/75.6),
                        StreamBuilder(stream: FirebaseFirestore.instance.collection("Users").doc(userdata.id.toString()).collection("wallet").snapshots(),
                          builder:
                              (context, snapshot) {
                            if(snapshot.hasData==null){
                              return Center(child: CircularProgressIndicator(),);
                            }
                            if(!snapshot.hasData){
                              return Center(child: CircularProgressIndicator(),);
                            }
                            if(snapshot.data!.docs.length==0){
                              return Center(child:  Text(EmptyTransactionstext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                  fontSize: width/30,
                                  color: Color(0xff8C8994)),),);
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {

                                var walletdata=snapshot.data!.docs[index];




                                return
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:235,
                                            child: Text(walletdata['title'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                                fontSize: width/30,
                                                color: Color(0xff8C8994)),),
                                          ),
                                          Column(
                                            children: [
                                              Text(walletdata['date'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                                  fontSize: width/30,
                                                  color: Color(0xff8C8994)),),
                                              Text(walletdata['time'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                                  fontSize: width/30,
                                                  color: Color(0xff8C8994)),),
                                            ],
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                        ],
                                      ),
                                      subtitle:
                                      SizedBox(
                                        height: 60,
                                        width: 250,
                                        child: Text("Content : ${walletdata['content'].toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                            textStyle: TextStyle(
                                                overflow: TextOverflow.ellipsis
                                            ),
                                            fontSize: width/30,
                                            color: Color(0xff8C8994)),),
                                      ),
                                    ),
                                  );
                              },);
                          },),


                        // Text(EmptyTransactionstext,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                        //     fontSize: width/30,
                        //     color: Color(0xff8C8994)),),



                      ],
                    ),
                  )
                ],
              ),

            ],
          ):
          _selectedIndex==3?
          Stack(
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

                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedIndex=0;
                                  animatesetvalue=0;
                                });

                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Applied_Histroy() ,));
                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedIndex=2;
                                  animatesetvalue=2;
                                });

                                //Navigator.push(context, MaterialPageRoute(builder: (context) =>Pandcard_apply_Page() ,));
                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Pandcard_apply_Page() ,));
                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Pancard_correction_Page() ,));
                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Reprint_Page() ,));
                              },
                              child: Row(
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
                            ),

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Pancard_Link_Page() ,));
                              },
                              child: Row(
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
                              userdata["picture"]==""?
                              CircleAvatar(
                                  radius: 25,
                                  foregroundImage: AssetImage(ProfileImage)):
                              CircleAvatar(
                                  radius: 25,
                                  foregroundImage: NetworkImage(userdata["picture"].toString())),
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
                        Text(userdata['name'].toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize: width/18,
                              color: Colors.white),),
                        Text("Wallet Balance : ₹ ${userdata['walletamount'].toString()}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize: width/24,
                              color: Color(0xffDAE2F2)),),

                        Text("+91${userdata['phone'].toString()}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize: width/24,
                              color: Color(0xffDAE2F2)),),
                        SizedBox(height:10),


                      ],
                    ),

                  ],
                ),
              ),
            ],
          ):
          const SizedBox(
            child: Text("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"),
          );

        },
      ),
      bottomNavigationBar:
      Material(
        color: Color(0xffFFFFFF),
        shadowColor: Colors.black12,
        elevation: 15,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        child: AnimatedContainer(
          height: 51,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
          ),
          child: Stack(
            children: [

              Padding(
                padding:  EdgeInsets.only(top:8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedIndex=0;
                          animatesetvalue=0;
                        });

                      },
                      child: Column(
                        children: [
                          Image.asset(Homeicon,height: height/30.24,
                          width:width/14.4,
                              // color: animatesetvalue==0?Color(0xff00194A):
                              // Color(0xffA0A0A0)
                          ),
                          Text("Home",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/30,
                                color: animatesetvalue==0?Color(0xff00194A):
                                Color(0xffA0A0A0)
                            ),)
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedIndex=1;
                          animatesetvalue=1;
                        });
                      },
                      child: Column(
                        children: [
                          Image.asset(applyedhistroyicon,height: height/30.24,
                              width:width/14.4
                          ),
                          Text("History",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/30,
                                  color: animatesetvalue==1?Color(0xff00194A):
                                  Color(0xffA0A0A0)
                              ))
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedIndex=2;
                          animatesetvalue=2;
                        });
                      },
                      child: Column(
                        children: [
                          Image.asset(walleticon,height: height/30.24,
                              width:width/14.4
                          ),
                          Text("Wallet",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/30,
                                  color: animatesetvalue==2?Color(0xff00194A):
                                  Color(0xffA0A0A0)
                              ))
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedIndex=3;
                          animatesetvalue=3;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.person,color: Color(0xff4E82EA),),
                          Text("Profile",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/30,
                              color: animatesetvalue==3?Color(0xff00194A):
                              Color(0xffA0A0A0)
                          ))
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.fastEaseInToSlowEaseOut,
                height: 3,width: 45,
                margin: EdgeInsets.only(left:
                animatesetvalue==0?20:
                animatesetvalue==1?110:
                animatesetvalue==2?205:
                animatesetvalue==3?290:0),
                color: Color(0xff245BCA),)
            ],
          ),
        ),
      )
    );
  }

}
