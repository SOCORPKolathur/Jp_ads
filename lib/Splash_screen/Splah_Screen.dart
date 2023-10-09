import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Authendication/LogIn_Page.dart';
import 'package:jp_ads/Landing_Screen/Landing_Screen.dart';
import 'package:jp_ads/const_file.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {


  @override
  void initState() {

    if(FirebaseAuth.instance.currentUser==null){
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  LogIn_Page(),));
      });
    }
    else{
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Landing_Screen(),));
      });
    }



    // TODO: implement initState
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 100.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 100,
                        width: 320,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/final logo (2).png")
                          )
                        ),
                      ),
                     Padding(
                       padding:  EdgeInsets.only(bottom: 18,left: 10),
                       child: Text(Quotes,
                style: GoogleFonts.poppins(
                   fontSize: width/30.4,
                  color: Colors.white),),
                     ),


                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("JP Ads",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,
                  //          fontSize: width/8.4,
                  //         color: Colors.white),),
                  //
                  //     Text(Quotes,
                  //       style: GoogleFonts.poppins(
                  //          fontSize: width/30.4,
                  //         color: Colors.white),),
                  //   ],
                  // ),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 200,
                child: Text(Quotes2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700,
                    fontSize: width/20.4,
                    color: Colors.white),),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
