import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Pancard_Link_Page extends StatefulWidget {
  const Pancard_Link_Page({super.key});

  @override
  State<Pancard_Link_Page> createState() => _Pancard_Link_PageState();
}

class _Pancard_Link_PageState extends State<Pancard_Link_Page> {

  TextEditingController Pannumbercontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: 70,
        title: Text("PAN Card Link",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Check Your Pan Link Status",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize:width/22,
                          color: Colors.black),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: 320,
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
                        controller: Pannumbercontroller,
                        maxLength: 10,
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),

                        ],
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                            hintText: "Type pan number",
                            hintStyle: GoogleFonts.poppins()
                        ),
                        validator: (value) => value!.isEmpty ? 'Field is required' : null,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 235,),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Center(
                            child:
                            Container(
                              height: 35,
                              width: 80,
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
                                child:  Text("Check",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/25,
                                      color: Colors.white),),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )


                  ],
                ),
              ),
            ],
          ),

          Container(
            height:220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffffe09f)
            ),
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Padding(
              padding:  EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pan Card Link Status",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/22,
                            color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Pan generated by",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/28,
                              color: Color(0xffA0A0A0)),),
                      ],
                    ),
                  ),
                  Divider(),

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Aadhaar Number",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/28,
                              color: Color(0xffA0A0A0)),),
                      ],
                    ),
                  ),
                  Divider(),

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Your PAN Number",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/28,
                              color: Color(0xffA0A0A0)),),
                      ],
                    ),
                  ),
                  Divider(),

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("PAN Current Status",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/28,
                              color: Color(0xffA0A0A0)),),
                      ],
                    ),
                  ),
                  Divider(),



                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  pancardstatuscheckfunction() async {
    var data=await FirebaseFirestore.instance.collection("New_applied").get();


  }



}
