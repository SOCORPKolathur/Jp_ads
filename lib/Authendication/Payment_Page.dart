
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/Landing_Screen/Landing_Screen.dart';


class Payment_Page extends StatefulWidget {
  String ? Type;
   Payment_Page({this.Type});

  @override
  State<Payment_Page> createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {

  TextEditingController Usernamecontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();
  TextEditingController amountcontroller=TextEditingController();

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
      body: Column(
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                maxLength: 10,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
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
                                onChanged: (_){
                                  // _formKey.currentState!.validate();
                                },
                              ),
                            )
                          ],
                        ),
                      ),




                      GestureDetector(
                        onTap: (){
                          Paymentdunction();
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
          ),

          Container(
            height: height/4.2,
            width: width/1.125,
            padding: EdgeInsets.symmetric(
              horizontal: width/36.0,
              vertical: height/75.6
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffFFFFFF)
            ),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("! Note:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                        fontSize:width/26,
                        color: Colors.black),),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle,size: width/24,),
                      SizedBox(width: width/72,),
                      SizedBox(
                        width: width/1.290,
                        child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/28,
                            color: Colors.black)),
                      )
                    ],
                  ),
                  SizedBox(height: height/151.2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle,size: width/24,),
                      SizedBox(width: width/72,),
                      SizedBox(
                        width: width/1.290,
                        child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/28,
                            color: Colors.black)),
                      )
                    ],
                  ),

                ]),
          ),

        ],
      ),
    );
  }

  Paymentdunction(){
    // FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).update({
    //   "payment":true,
    // });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const  Landing_Screen(),));

  }


}
