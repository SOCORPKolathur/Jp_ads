import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart'as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jp_ads/const_file.dart';
import 'package:lottie/lottie.dart';

import '../Landing_Screen/Landing_Screen.dart';
import 'Add walletAmount Page.dart';

class Reprint_Page extends StatefulWidget {
  String ?Userdocid;
  String ?UserType;
  String ?UserWalletamount;
  int ?Usagecount;
  Reprint_Page({this.Userdocid,this.UserType,this.UserWalletamount,this.Usagecount});

  @override
  State<Reprint_Page> createState() => _Reprint_PageState();
}

class _Reprint_PageState extends State<Reprint_Page> {

  TextEditingController printPannumbercontroller=TextEditingController();
  TextEditingController printnamecontroller=TextEditingController();
  TextEditingController printfathernamecontroller=TextEditingController();
  TextEditingController printdobcontroller=TextEditingController();
  TextEditingController printnameandvillagecontroller=TextEditingController();
  TextEditingController printpostofficecontroller=TextEditingController();
  TextEditingController printdistrictcontroller=TextEditingController();
  TextEditingController printstatecontroller=TextEditingController();
  TextEditingController printpincodecontroller=TextEditingController();
  TextEditingController printphonenumbercontroller=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String selectedValuegender='Select Gender';
  List<String>Gender=['Select Gender',"Male","Female","Transgender"];
  bool Datasubmitted=false;

  @override
  void initState() {
    checkusagecount();
    // TODO: implement initState
    super.initState();
  }


  checkusagecount()async{

    var document=await FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).get();
    if(document['usertype']=="Individual"){
      if(document['usageccount']==3){
        return  awesomeDialog("Warning....!", "Exist Your Free Apply",4);
      }
    }
    if(document['walletamount']<=157){
      return  awesomeDialog("Warning....!", 'Your Balance is Low Kindly Recharge Wallet Minimum Recharge Rs: 500',2);
    }
  }



  final RegExp _inputPattern = RegExp(r'^\d{4}\s\d{4}\s\d{4}$');
  double normal_fees=0;
  double Gst=0;
  double Total=0;
  int steppervalue=0;
  bool Loading=false;
  bool imgaeSelcted=false;
  double FirebaseWalletAmount=0;
  File ?_photo1;
  File ?_photo2;
  File ?_photo3;
  File ?_photo4;
  File ?_photo5;
  String imageUrl="";
  String  imageUrl2="";
  String  imageUrl3="";
  String  imageUrl4="";
  String  imageUrl5="";


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: height/10.8,
        title: Text("Lost/Missing PAN Card",
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key:_formKey,
              child: Column(

                children: [

                  SizedBox(height: height/75.6,),

                  Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:height/54,left: width/18),
                        child: Container(
                          width: width/1.1612,
                          height: height/92.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:height/54,left: width/18),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: steppervalue*width/4.8,
                            height: height/92.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.green)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:height/189),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                AnimatedContainer(
                                  height:height/28.909,
                                  width:width/13.6,
                                  duration: Duration(milliseconds: 1000),
                                  decoration: BoxDecoration(
                                      color: steppervalue>=0?Colors.green:Colors.grey,
                                      borderRadius: BorderRadius.circular(100),

                                      border: Border.all(color: steppervalue>=0?Colors.white:Colors.transparent,width: 1)
                                  ),
                                  child: Center(child: steppervalue!=0? Icon(Icons.done,color: Colors.white,size: width/24,):
                                  Text("1",style: GoogleFonts.poppins(
                                      color:Colors.white
                                  ))),
                                ),
                                Text("1.From\nSubmit",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                      color:steppervalue>=0?Colors.green:Colors.black, fontSize: width/36.0),)
                              ],
                            ),
                            Column(
                              children: [
                                AnimatedContainer(
                                  height:height/28.909,
                                  width:width/13.6,
                                  duration: Duration(milliseconds: 1000),
                                  decoration: BoxDecoration(
                                      color: steppervalue>=1?Colors.green:Colors.grey,
                                      borderRadius: BorderRadius.circular(100),

                                      border: Border.all(color: steppervalue>=1?Colors.white:Colors.transparent,width: 1)
                                  ),
                                  child: Center(child: steppervalue>1?
                                  Icon(Icons.done,color: Colors.white,size: width/24):
                                  Text("2",style: GoogleFonts.poppins(
                                      color:Colors.white
                                  ))),
                                ),
                                Text("2.Photo\nUpload",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                      color:steppervalue>=1?Colors.green:Colors.black, fontSize: width/36.0),)
                              ],
                            ),
                            Column(
                              children: [
                                AnimatedContainer(
                                  height:height/28.909,
                                  width:width/13.6,
                                  duration: Duration(milliseconds: 1000),
                                  decoration: BoxDecoration(
                                      color: steppervalue>=2?Colors.green:Colors.grey,
                                      borderRadius: BorderRadius.circular(100),

                                      border: Border.all(color: steppervalue>=2?Colors.white:Colors.transparent,width: 1)
                                  ),
                                  child: Center(child: steppervalue>2?
                                  Icon(Icons.done,color: Colors.white,size: width/24):
                                  Text("3",style: GoogleFonts.poppins(
                                      color:Colors.white
                                  ))),
                                ),
                                Text("3.Signature\nUpload",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                      color:steppervalue>=2?Colors.green:Colors.black, fontSize: width/36.0),)
                              ],
                            ),
                            Column(
                              children: [
                                AnimatedContainer(
                                  height:height/28.909,
                                  width:width/13.6,
                                  duration: Duration(milliseconds: 1000),
                                  decoration: BoxDecoration(
                                      color: steppervalue>=3?Colors.green:Colors.grey,
                                      borderRadius: BorderRadius.circular(100),

                                      border: Border.all(color: steppervalue>=3?Colors.white:Colors.transparent,width: 1)
                                  ),
                                  child: Center(child: steppervalue>3?
                                  Icon(Icons.done,color: Colors.white,size: width/24):
                                  Text("4",style: GoogleFonts.poppins(
                                      color:Colors.white
                                  ))),
                                ),
                                Text("4.Document\nUpload", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                    color:steppervalue>=3?Colors.green:Colors.black, fontSize: width/36.0),)
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     AnimatedContainer(
                            //       height:height/28.909,
                            //       width:width/13.6,
                            //       duration: Duration(milliseconds: 1000),
                            //
                            //       decoration: BoxDecoration(
                            //           color: steppervalue>=4?Colors.green:Colors.grey,
                            //           borderRadius: BorderRadius.circular(100),
                            //
                            //           border: Border.all(color: steppervalue>=4?Colors.white:Colors.transparent,width: 1)
                            //       ),
                            //       child: Center(child: steppervalue>4?
                            //       Icon(Icons.done,color: Colors.white,size: width/24):
                            //       Text("5",style: GoogleFonts.poppins(
                            //           color:Colors.white
                            //       ))),
                            //     ),
                            //     Text("5.Existing\nPan Card", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                            //         color:steppervalue>=4?Colors.green:Colors.black, fontSize: width/36.0),)
                            //   ],
                            // ),
                            Column(
                              children: [
                                AnimatedContainer(
                                  height:height/28.909,
                                  width:width/13.6,
                                  duration: Duration(milliseconds: 1000),

                                  decoration: BoxDecoration(
                                      color: steppervalue>=4?Colors.green:Colors.grey,
                                      borderRadius: BorderRadius.circular(100),

                                      border: Border.all(color: steppervalue>=4?Colors.white:Colors.transparent,width: 1)
                                  ),
                                  child: Center(child: steppervalue>4?
                                  Icon(Icons.done,color: Colors.white,size: width/24):
                                  Text("5",style: GoogleFonts.poppins(
                                      color:Colors.white
                                  ))),
                                ),
                                Text("5.Payment\n", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                    color:steppervalue>=4?Colors.green:Colors.black, fontSize: width/36.0),)
                              ],
                            ),

                          ],
                        ),
                      )


                    ],
                  ),



                  SizedBox(height: height/75.6),

                  SizedBox(
                    height: height/1.426,
                    child:
                    steppervalue==0?
                    SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child:  Container(
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

                                ///pan number
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Aadhaar Number *",
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
                                          controller: printPannumbercontroller,
                                          maxLength: 14,
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                            TextInputFormatter.withFunction((oldValue, newValue) {
                                              final newString = newValue.text;

                                              if (_inputPattern.hasMatch(newString)) {
                                                return oldValue;
                                              }

                                              var formattedValue =
                                              newString.replaceAllMapped(RegExp(r'\d{4}'), (match) {
                                                return '${match.group(0)} ';
                                              });

                                              // Remove any trailing space
                                              if (formattedValue.endsWith(' ')) {
                                                formattedValue = formattedValue.substring(0, formattedValue.length - 1);
                                              }

                                              return TextEditingValue(
                                                text: formattedValue,
                                                selection: TextSelection.collapsed(offset: formattedValue.length),
                                              );
                                            }),
                                          ],
                                          decoration: InputDecoration(
                                              counterText: "",
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type Aadhaar Number",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) {
                                            if(value!.isEmpty){
                                              return 'Field is required';
                                            }
                                            else if(value.isNotEmpty){
                                              if(value.length!=14){
                                                return 'Enter the Aadhaar card no correctly';
                                              }
                                            }
                                          },
                                        ),
                                        // TextFormField(
                                        //   textCapitalization: TextCapitalization.characters,
                                        //   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        //       fontSize:width/22,
                                        //       color: Colors.black),
                                        //   controller: printPannumbercontroller,
                                        //   maxLength: 10,
                                        //   maxLines: 1,
                                        //   inputFormatters: [
                                        //     FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                        //
                                        //   ],
                                        //   decoration: InputDecoration(
                                        //     counterText: "",
                                        //     contentPadding: EdgeInsets.only(left: width/18),
                                        //     border: InputBorder.none,
                                        //       hintText: "Type pan number",
                                        //       hintStyle: GoogleFonts.poppins()
                                        //   ),
                                        //   validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                        //
                                        // ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Name
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Your Name *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                          ],
                                          controller: printnamecontroller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type full name",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                ///Father name
                                SizedBox(
                                  height: height/6.048,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Father Name *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                          ],
                                          controller: printfathernamecontroller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type father name",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Date of birth
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Date of Birth *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          readOnly: true,
                                          controller: printdobcontroller,
                                          onTap: (){
                                            Datepickerfunction(context);
                                          },
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type date of birth",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Gender
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gender *",
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
                                        child:  DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField2<String>(

                                            isExpanded: true,
                                            hint: Text(
                                              'Select Gender',
                                              style: TextStyle(
                                                fontSize: width/25.714,
                                                color: Theme.of(context).hintColor,
                                              ),
                                            ),
                                            items: Gender
                                                .map((String item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style:  GoogleFonts.poppins(
                                                  fontSize: width/25.714,
                                                ),
                                              ),
                                            ))
                                                .toList(),
                                            value: selectedValuegender,
                                            validator: (value) => value=="Select Gender" ? 'Field is required' : null,
                                            onChanged: (String? value) {
                                              setState(() {
                                                selectedValuegender = value!;
                                              });
                                            },
                                            buttonStyleData:  ButtonStyleData(
                                              padding: EdgeInsets.symmetric(horizontal: width/22.5),
                                              height: height/18.9,
                                              width: width/2.571,
                                            ),
                                            menuItemStyleData:  MenuItemStyleData(
                                              height: height/18.9,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                ///Name of Promise
                                SizedBox(
                                  height: height/6.048,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Village/Town/ Locality *",
                                        textAlign: TextAlign.start,
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLines: null,
                                          controller: printnameandvillagecontroller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type Village and more",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Post Office
                               /* SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Post Office *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLines: null,
                                          controller: printpostofficecontroller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type post office",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),*/
                                ///District
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("District *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s\.,#-]+$',)),
                                          ],
                                          controller: printdistrictcontroller,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type district name",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                ///State
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("State *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s\.,#-]+$',)),
                                          ],
                                          controller: printstatecontroller,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type state name",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                ///Pin code
                                SizedBox(
                                  height: height/7.56,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Pin Code *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLength: 6,
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                          ],
                                          keyboardType:TextInputType.number,
                                          controller: printpincodecontroller,
                                          decoration: InputDecoration(
                                              counterText: "",
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type pincode",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) {
                                            if(value!.isEmpty){
                                              return 'Field is required';
                                            }
                                            else if(value.isNotEmpty){
                                              if(value.length!=6){
                                                return 'Enter the Pin Code correctly';
                                              }
                                            }
                                          },

                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Phone number(Optiinally)
                                SizedBox(
                                  height:height/5.815,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Applicant Phone Number *",
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
                                          textCapitalization: TextCapitalization.characters,
                                          maxLength: 10,
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                          ],
                                          keyboardType:TextInputType.number,
                                          controller: printphonenumbercontroller,
                                          decoration: InputDecoration(
                                              counterText: "",
                                              contentPadding: EdgeInsets.only(left: width/18),
                                              border: InputBorder.none,
                                              hintText: "Type phone number",
                                              hintStyle: GoogleFonts.poppins()
                                          ),
                                          validator: (value) {
                                            if(value!.isEmpty){
                                              return 'Field is required';
                                            }
                                            else if(value.isNotEmpty){
                                              if(value.length!=10){
                                                return 'Enter the Phone no correctly';
                                              }
                                            }
                                          },

                                        ),
                                      )
                                    ],
                                  ),
                                ),



                              ]),
                        ),
                      ),

                    ):
                    steppervalue==1?
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(height: height/47.25,),

                          Text("Upload Documents",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/22,
                                color: Colors.black),),
                          SizedBox(height: height/47.25,),
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("2.Photo Upload",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/47.25,),

                          ///img-1(_photo1)
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("Photo Upload With Signature",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/47.25,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return
                                  Padding(
                                    padding: EdgeInsets.only(top: 220, bottom: 220),
                                    child: AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Please Select the Options", style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 15),),
                                        ],
                                      ),
                                      content: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(leading: Icon(Icons.camera),
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.camera)
                                                    .then((value) async {
                                                  if (value != null) {
                                                    final croppedFile = await ImageCropper().cropImage(
                                                      sourcePath: value!.path,
                                                      compressFormat: ImageCompressFormat.jpg,
                                                      compressQuality: 100,
                                                      uiSettings: [
                                                        AndroidUiSettings(
                                                            toolbarTitle: 'Cropper',
                                                            toolbarColor: Color(0xff245BCA),
                                                            toolbarWidgetColor: Colors.white,
                                                            initAspectRatio: CropAspectRatioPreset.ratio16x9,
                                                            lockAspectRatio: false),
                                                        IOSUiSettings(
                                                          title: 'Cropper',
                                                        ),
                                                        WebUiSettings(
                                                          context: context,
                                                          presentStyle: CropperPresentStyle.dialog,
                                                          boundary: const CroppieBoundary(
                                                            width: 520,
                                                            height: 520,
                                                          ),
                                                          viewPort:
                                                          const CroppieViewPort(width: 480, height: 480, type: 'circle'),
                                                          enableExif: true,
                                                          enableZoom: true,
                                                          showZoomer: true,
                                                        ),
                                                      ],
                                                    );
                                                    if (croppedFile != null) {
                                                      setState(() {
                                                        _photo1 = File(croppedFile.path);
                                                      });
                                                    }
                                                    if(_photo1!=null&&_photo5!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                                setState((){});
                                              },
                                              title:
                                              Text("Camera",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),
                                          SizedBox(height: 10),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.gallery)
                                                    .then((value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _photo1 = File(value.path);
                                                    });
                                                    if(_photo1!=null&&_photo5!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                              },
                                              leading: Icon(Icons.browse_gallery),
                                              title: Text("Gallery",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                              },);

                            },
                            child: Container(
                              height: height/7.56,
                              width: width/1.125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffFFFFFF),

                              ),

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    _photo1==null? Image.asset(Uploaddocimg):Image.file(_photo1!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                    _photo1==null?
                                    Text("Upload File",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/26,
                                          color: Colors.black),):Text(""),

                                  ]),
                            ),
                          ),
                          SizedBox(height: height/47.25,),


                          ///img-2(_photo5)
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("Photo Upload Without Signature",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/47.25,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return
                                  Padding(
                                    padding: EdgeInsets.only(top: 220, bottom: 220),
                                    child: AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Please Select the Options", style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 15),),
                                        ],
                                      ),
                                      content: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(leading: Icon(Icons.camera),
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.camera)
                                                    .then((value) async {
                                                  if (value != null) {
                                                    final croppedFile = await ImageCropper().cropImage(
                                                      sourcePath: value!.path,
                                                      compressFormat: ImageCompressFormat.jpg,
                                                      compressQuality: 100,
                                                      uiSettings: [
                                                        AndroidUiSettings(
                                                            toolbarTitle: 'Cropper',
                                                            toolbarColor: Color(0xff245BCA),
                                                            toolbarWidgetColor: Colors.white,
                                                            initAspectRatio: CropAspectRatioPreset.ratio16x9,
                                                            lockAspectRatio: false),
                                                        IOSUiSettings(
                                                          title: 'Cropper',
                                                        ),
                                                        WebUiSettings(
                                                          context: context,
                                                          presentStyle: CropperPresentStyle.dialog,
                                                          boundary: const CroppieBoundary(
                                                            width: 520,
                                                            height: 520,
                                                          ),
                                                          viewPort:
                                                          const CroppieViewPort(width: 480, height: 480, type: 'circle'),
                                                          enableExif: true,
                                                          enableZoom: true,
                                                          showZoomer: true,
                                                        ),
                                                      ],
                                                    );
                                                    if (croppedFile != null) {
                                                      setState(() {
                                                        _photo5 = File(croppedFile.path);
                                                      });
                                                    }
                                                    if(_photo1!=null&&_photo5!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                                setState((){});
                                              },
                                              title:
                                              Text("Camera",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),
                                          SizedBox(height: 10),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.gallery)
                                                    .then((value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _photo5 = File(value.path);
                                                    });
                                                    if(_photo1!=null&&_photo5!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                              },
                                              leading: Icon(Icons.browse_gallery),
                                              title: Text("Gallery",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                              },);

                            },
                            child: Container(
                              height: height/7.56,
                              width: width/1.125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffFFFFFF),

                              ),

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    _photo5==null? Image.asset(Uploaddocimg):Image.file(_photo5!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                    _photo5==null?
                                    Text("Upload File",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/26,
                                          color: Colors.black),):Text(""),

                                  ]),
                            ),
                          ),
                          SizedBox(height: height/47.25,),

                          Container(
                            height: height/4.2,
                            width: width/1.125,
                            padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
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
                                        child: Text("Image Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                            fontSize:width/28,
                                            color: Colors.black)),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height/151.2,),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Icon(Icons.circle,size: width/24,),
                                  //     SizedBox(width: width/72,),
                                  //     SizedBox(
                                  //       width: width/1.290,
                                  //       child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  //           fontSize:width/28,
                                  //           color: Colors.black)),
                                  //     )
                                  //   ],
                                  // ),

                                ]),
                          ),

                          SizedBox(height: height/47.25,),


                        ],
                      ),
                    ):
                    steppervalue==2?
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height/47.25,),

                          Text("Upload Documents",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/22,
                                color: Colors.black),),

                          SizedBox(height: height/47.25,),
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("3.Signature Upload",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/47.25,),

                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return  Padding(
                                  padding: EdgeInsets.only(top: 220, bottom: 220),
                                  child: AlertDialog(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Please Select the Options", style: TextStyle(
                                            fontWeight: FontWeight.w700, fontSize: 15),),
                                      ],
                                    ),
                                    content: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: ListTile(leading: Icon(Icons.camera),
                                            onTap: () async {
                                              final picker = ImagePicker();
                                              await picker.pickImage(source: ImageSource.camera)
                                                  .then((value) async {
                                                if (value != null) {
                                                  final croppedFile = await ImageCropper().cropImage(
                                                    sourcePath: value!.path,
                                                    compressFormat: ImageCompressFormat.jpg,
                                                    compressQuality: 100,
                                                    uiSettings: [
                                                      AndroidUiSettings(
                                                          toolbarTitle: 'Cropper',
                                                          toolbarColor: Color(0xff245BCA),
                                                          toolbarWidgetColor: Colors.white,
                                                          initAspectRatio: CropAspectRatioPreset.ratio16x9,
                                                          lockAspectRatio: false),
                                                      IOSUiSettings(
                                                        title: 'Cropper',
                                                      ),
                                                      WebUiSettings(
                                                        context: context,
                                                        presentStyle: CropperPresentStyle.dialog,
                                                        boundary: const CroppieBoundary(
                                                          width: 520,
                                                          height: 520,
                                                        ),
                                                        viewPort:
                                                        const CroppieViewPort(width: 480, height: 480, type: 'circle'),
                                                        enableExif: true,
                                                        enableZoom: true,
                                                        showZoomer: true,
                                                      ),
                                                    ],
                                                  );
                                                  if (croppedFile != null) {
                                                    setState(() {
                                                      _photo2 = File(croppedFile.path);
                                                      imgaeSelcted=false;
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                }
                                              });
                                              setState((){});
                                            },
                                            title:
                                            Text("Camera",
                                              style: TextStyle(fontWeight: FontWeight.w700),),),
                                        ),
                                        SizedBox(height: 10),

                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: ListTile(
                                            onTap: () async {
                                              final picker = ImagePicker();
                                              await picker.pickImage(source: ImageSource.gallery)
                                                  .then((value) {
                                                if (value != null) {
                                                  setState(() {
                                                    _photo2 = File(value.path);
                                                    imgaeSelcted=false;
                                                  });
                                                  Navigator.pop(context);
                                                }
                                              });
                                            },
                                            leading: Icon(Icons.browse_gallery),
                                            title: Text("Gallery",
                                              style: TextStyle(fontWeight: FontWeight.w700),),),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },);

                            },
                            child: Container(
                              height: height/7.56,
                              width: width/1.125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffFFFFFF)
                              ),

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    _photo2==null? Image.asset(Uploaddocimg):Image.file(_photo2!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                    _photo2==null?
                                    Text("Upload File",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/26,
                                          color: Colors.black),):Text(""),



                                  ]),
                            ),
                          ),
                          SizedBox(height: height/47.25,),
                          Container(
                            height: height/4.2,
                            width: width/1.125,
                            padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
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

                          SizedBox(height: height/47.25,),


                        ],
                      ),
                    ):
                    steppervalue==3?
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(height: height/47.25,),

                          Text("Upload Documents",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/22,
                                color: Colors.black),),
                          SizedBox(height: height/47.25,),
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("4.Aadhaar Card Upload",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/47.25,),

                          //front page
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("Front Side Of Aadhaar Card" ,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/28,
                                    color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/107.25,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return
                                  Padding(
                                    padding: EdgeInsets.only(top: 220, bottom: 220),
                                    child: AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Please Select the Options", style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 15),),
                                        ],
                                      ),
                                      content: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(leading: Icon(Icons.camera),
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.camera)
                                                    .then((value) async {
                                                  if (value != null) {
                                                    final croppedFile = await ImageCropper().cropImage(
                                                      sourcePath: value!.path,
                                                      compressFormat: ImageCompressFormat.jpg,
                                                      compressQuality: 100,
                                                      uiSettings: [
                                                        AndroidUiSettings(
                                                            toolbarTitle: 'Cropper',
                                                            toolbarColor: Color(0xff245BCA),
                                                            toolbarWidgetColor: Colors.white,
                                                            initAspectRatio: CropAspectRatioPreset.ratio16x9,
                                                            lockAspectRatio: false),
                                                        IOSUiSettings(
                                                          title: 'Cropper',
                                                        ),
                                                        WebUiSettings(
                                                          context: context,
                                                          presentStyle: CropperPresentStyle.dialog,
                                                          boundary: const CroppieBoundary(
                                                            width: 520,
                                                            height: 520,
                                                          ),
                                                          viewPort:
                                                          const CroppieViewPort(width: 480, height: 480, type: 'circle'),
                                                          enableExif: true,
                                                          enableZoom: true,
                                                          showZoomer: true,
                                                        ),
                                                      ],
                                                    );
                                                    if (croppedFile != null) {
                                                      setState(() {
                                                        _photo3 = File(croppedFile.path);
                                                      });
                                                    }
                                                    if(_photo3!=null&&_photo4!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                                setState((){});
                                              },
                                              title:
                                              Text("Camera",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),
                                          SizedBox(height: 10),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.gallery)
                                                    .then((value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _photo3 = File(value.path);
                                                    });
                                                    if(_photo3!=null&&_photo4!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                              },
                                              leading: Icon(Icons.browse_gallery),
                                              title: Text("Gallery",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );

                              },);
                            },
                            child: Container(
                              height: height/7.56,
                              width: width/1.125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffFFFFFF)
                              ),

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    _photo3==null? Image.asset(Uploaddocimg):Image.file(_photo3!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                    _photo3==null?
                                    Text("Upload File",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/26,
                                          color: Colors.black),):Text(""),


                                  ]),
                            ),
                          ),
                          SizedBox(height: height/47.25,),

                          ///back page
                          Padding(
                            padding:  EdgeInsets.only(left: width/14.4),
                            child: Row(
                              children: [
                                Text("Back Side Of Aadhaar Card", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/28,
                                    color: Colors.black),),
                              ],
                            ),
                          ),
                          SizedBox(height: height/107.25,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return
                                  Padding(
                                    padding: EdgeInsets.only(top: 220, bottom: 220),
                                    child: AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Please Select the Options", style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 15),),
                                        ],
                                      ),
                                      content: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(leading: Icon(Icons.camera),
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.camera)
                                                    .then((value) async {
                                                  if (value != null) {
                                                    final croppedFile = await ImageCropper().cropImage(
                                                      sourcePath: value!.path,
                                                      compressFormat: ImageCompressFormat.jpg,
                                                      compressQuality: 100,
                                                      uiSettings: [
                                                        AndroidUiSettings(
                                                            toolbarTitle: 'Cropper',
                                                            toolbarColor: Color(0xff245BCA),
                                                            toolbarWidgetColor: Colors.white,
                                                            initAspectRatio: CropAspectRatioPreset.ratio16x9,
                                                            lockAspectRatio: false),
                                                        IOSUiSettings(
                                                          title: 'Cropper',
                                                        ),
                                                        WebUiSettings(
                                                          context: context,
                                                          presentStyle: CropperPresentStyle.dialog,
                                                          boundary: const CroppieBoundary(
                                                            width: 520,
                                                            height: 520,
                                                          ),
                                                          viewPort:
                                                          const CroppieViewPort(width: 480, height: 480, type: 'circle'),
                                                          enableExif: true,
                                                          enableZoom: true,
                                                          showZoomer: true,
                                                        ),
                                                      ],
                                                    );
                                                    if (croppedFile != null) {
                                                      setState(() {
                                                        _photo4 = File(croppedFile.path);
                                                      });
                                                    }
                                                    if(_photo3!=null&&_photo4!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                });
                                                setState((){});
                                              },
                                              title:
                                              Text("Camera",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),
                                          SizedBox(height: 10),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListTile(
                                              onTap: () async {
                                                final picker = ImagePicker();
                                                await picker.pickImage(source: ImageSource.gallery)
                                                    .then((value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _photo4 = File(value.path);
                                                    });
                                                    if(_photo3!=null&&_photo4!=null){
                                                      setState((){
                                                        imgaeSelcted=false;
                                                      });
                                                    }
                                                    Navigator.pop(context);

                                                  }
                                                });
                                              },
                                              leading: Icon(Icons.browse_gallery),
                                              title: Text("Gallery",
                                                style: TextStyle(fontWeight: FontWeight.w700),),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );

                              },);
                            },
                            child: Container(
                              height: height/7.56,
                              width: width/1.125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffFFFFFF)
                              ),

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    _photo4==null? Image.asset(Uploaddocimg):Image.file(_photo4!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                    _photo4==null?
                                    Text("Upload File",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/26,
                                          color: Colors.black),):Text(""),


                                  ]),
                            ),
                          ),
                          SizedBox(height: height/47.25,),
                          Container(
                            height: height/4.2,
                            width: width/1.125,
                            padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
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
                                        child: Text("Images Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
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
                                        child: Text("Please Correct the Edge to Upload Image",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                            fontSize:width/28,
                                            color: Colors.black)),
                                      )
                                    ],
                                  ),

                                ]),
                          ),

                          SizedBox(height: height/47.25,),



                        ],
                      ),
                    ):
                    steppervalue==4?
                    SizedBox(child:Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: height/94.5,
                              horizontal: width/45
                          ),
                          child: Container(
                            height:height/2.52,
                            width:width/1.090,
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

                                    Text("Total Amount",style: GoogleFonts.poppins(fontWeight:FontWeight.w600),),
                                    Text("₹ ${Total.toString()}",
                                      style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                        fontSize: width/16.363,

                                      ),),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height:height/378,
                                          width:width/1.8,
                                          color: Colors.grey,
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)

                                      ],
                                    ),

                                    Text("Payment Now for new PAN Card Application",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),),

                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,
                                            child: Text("Normal Fees :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        Container(
                                            height: height/37.8,
                                            width: width/4.5,

                                            child: Text("₹ ${normal_fees.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,

                                            child: Text("TAX :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        Container(
                                            height: height/37.8,
                                            width: width/4.5,

                                            child: Text("0",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),
                                    Divider(color: Colors.black,),

                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,

                                            child: Text("Total Fees :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        Container(
                                            height: height/37.8,
                                            width: width/4.5,

                                            child: Text("₹ ${Total.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,

                                            child: Text("You have wallet : (${widget.UserWalletamount.toString()}) ",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        Container(
                                            height: height/37.8,
                                            width: width/4.5,

                                            child: Text("₹ -${Total.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,

                                            child: Text("Your wallet Balance :  ",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        Container(
                                            height: height/37.8,
                                            width: width/4.5,

                                            child: Text("₹ ${FirebaseWalletAmount.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),
                                    Divider(color: Colors.black,),
                                    Row(
                                      children: [
                                        Container(
                                            height: height/37.8,
                                            width: width/1.636,
                                            child: Text("Payable amount :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                        SizedBox(
                                            height: height/37.8,
                                            width: width/4.5,
                                            child: Text(
                                              widget.UserWalletamount!=0?
                                              "₹ ${Total.toString()}":"₹ 0.00",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                      ],
                                    ),

                                  ]),

                            ),
                          ),
                        ),
                        SizedBox(height: height/25.2,),


                      ],
                    )):
                    const SizedBox(),
                  ),

                  SizedBox(height: height/151.2),

                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      steppervalue>0?
                      GestureDetector(
                        onTap: (){

                          if(steppervalue>0){
                            setState(() {
                              steppervalue--;
                              imgaeSelcted=false;
                            });
                          }
                          if(steppervalue==0){
                            setState(() {
                              _photo1=null;
                              _photo5=null;
                              imgaeSelcted=false;
                            });
                          }
                          else if(steppervalue==1){
                            setState(() {
                              _photo2=null;
                              imgaeSelcted=false;
                            });
                          }
                          else if(steppervalue==2){
                            setState(() {
                              _photo3=null;
                              _photo4=null;
                              imgaeSelcted=false;
                            });
                          }

                        },
                        child: Center(
                          child:
                          Container(
                            height: height/21.6,
                            width: width/4.5,
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
                              child:  Text("Previous",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/28,
                                    color: Colors.white),),
                            ),
                          ),
                        ),
                      ):
                      SizedBox(
                        height: height/21.6,
                        width: width/4.5,),
                      SizedBox(width: width/7.2,),

                      steppervalue==4?
                      GestureDetector(
                        onTap: () async {

                          firebasestroragefunctionphoto();
                        },
                        child: Center(
                          child:
                          Container(
                            height: height/21.6,
                            width: width/4.5,
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
                                    fontSize:width/28,
                                    color: Colors.white),),
                            ),
                          ),
                        ),
                      ):
                      GestureDetector(
                        onTap: (){

                          if(imgaeSelcted==false){
                            if (_formKey.currentState!.validate()&& selectedValuegender!="Select Gender"&&printPannumbercontroller.text.length==14
                                &&printpincodecontroller.text.length==6&&printphonenumbercontroller.text.length==10) {

                              if (steppervalue < 4) {
                                setState(() {
                                  steppervalue++;
                                  imgaeSelcted=false;
                                });
                              }
                              if (steppervalue == 4) {
                                paymentfunction();
                              }
                              if(steppervalue>0&&steppervalue<4) {
                                setState(() {
                                  imgaeSelcted = true;
                                });

                              }

                            }


                          }
                          else{
                            return
                              photerrorDialog("Photo Are Invalid",
                                  "Please Select the Image");
                          }

                        },
                        child: Center(
                          child:
                          Container(
                            height: height/21.6,
                            width: width/4.5,
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
                              child:  Text("Next",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/28,
                                    color: Colors.white),),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),


                ],
              ),
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
      )
    );
  }


  Datepickerfunction(ctx) async {
    DateTime? pickedDate = await showDatePicker(
        context: ctx,
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        initialDate: DateTime.now(),
        fieldHintText: "enter your date of birthday",
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??Text(""),
          );
        }
    );
    if (pickedDate != null) {
      DateTime now = DateTime.now();
      DateTime minDate = DateTime(now.year - 18, now.month, now.day);

      if (pickedDate.isBefore(minDate)) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        printdobcontroller.text = formattedDate;
      } else {
       /* showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Date'),
              content: Text('Selected date should be at least 18 years ago.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );*/
        awesomeDialog("Your Are Not Major","Kindly Apply to New Apply Pan card",1);
      }
    }
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
        errortype==2?
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>
                addwallet_Amount_Page(widget.Userdocid,widget.UserType))):Navigator.pop(context);

      },
    )..show();
  }

  photerrorDialog(title,description){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {
      },
    )..show();
  }


  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
  firebasestroragefunctionphoto() async {

    if((double.parse(widget.UserWalletamount.toString())-Total).isNegative){
      print(double.parse(widget.UserWalletamount.toString())-Total);
      return awesomeDialog("Low Wallet Amount", "Please Recharge Wallet Amount",2);
    }
    else{
      if(double.parse(widget.UserWalletamount.toString())-Total>0){
        setState(() {
          Loading=true;
        });
          var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo1.jpg");
          var uploadTask = await ref.putFile(_photo1!).catchError((error) async {
          });
          var image = await uploadTask.ref.getDownloadURL();
          setState(() {
            imageUrl=image;
          });

          var ref2 = FirebaseStorage.instance.ref().child('Images').child("$_photo2.jpg");
          var uploadTask2 = await ref2.putFile(_photo2!).catchError((error) async {
          });
          var image2 = await uploadTask2.ref.getDownloadURL();
          setState(() {
            imageUrl2=image2;
          });


          var ref3 = FirebaseStorage.instance.ref().child('Images').child("$_photo3.jpg");
          var uploadTask3 = await ref3.putFile(_photo3!).catchError((error) async {

          });
          var image3 = await uploadTask3.ref.getDownloadURL();
          setState(() {
            imageUrl3=image3;
          });

          var ref4 = FirebaseStorage.instance.ref().child('Images').child("$_photo4.jpg");
          var uploadTask4 = await ref4.putFile(_photo4!).catchError((error) async {

          });
          var image4 = await uploadTask4.ref.getDownloadURL();
          setState(() {
            imageUrl4=image4;
          });

          var ref5 = FirebaseStorage.instance.ref().child('Images').child("$_photo5.jpg");
          var uploadTask5 = await ref5.putFile(_photo5!).catchError((error) async {
          });
          var image5 = await uploadTask5.ref.getDownloadURL();
          setState(() {
            imageUrl5=image5;
          });
        String documentid=generateRandomString(16);
          if(widget.UserType=="Individual"){
            FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
              "usageccount":FieldValue.increment(1),
              "walletamount":FieldValue.increment(-Total),
            });

            FirebaseFirestore.instance.collection("Reprint_document").doc(documentid).set({
              "name":printnamecontroller.text,
              "fathername":printfathernamecontroller.text,
              "dob":printdobcontroller.text,
              "gender":selectedValuegender,
              "village_town":printnameandvillagecontroller.text,
              "postoffice":printpostofficecontroller.text,
              "district":printdistrictcontroller.text,
              "state":printstatecontroller.text,
              "pincode":printpincodecontroller.text,
              "phoneno":printphonenumbercontroller.text,
              "Type":"Lost Pan card",
              "usertype":widget.UserType,
              "photo":imageUrl,
              "photo2":imageUrl5,
              "signpicture":imageUrl2,
              "aadharpicture":imageUrl3,
              "aadharpicture2":imageUrl4,
              "updatestatus":"",
              "panno":printPannumbercontroller.text,
              "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              "time":DateFormat('hh:mm a').format(DateTime.now()),
              "timestamp":DateTime.now().millisecondsSinceEpoch,
              "count":true,
            });
            FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Reprint_document").doc(documentid).set({
              "name":printnamecontroller.text,
              "fathername":printfathernamecontroller.text,
              "dob":printdobcontroller.text,
              "gender":selectedValuegender,
              "village_town":printnameandvillagecontroller.text,
              "postoffice":printpostofficecontroller.text,
              "district":printdistrictcontroller.text,
              "state":printstatecontroller.text,
              "pincode":printpincodecontroller.text,
              "phoneno":printphonenumbercontroller.text,
              "Type":"Lost Pan card",
              "photo":imageUrl,
              "photo2":imageUrl5,
              "signpicture":imageUrl2,
              "aadharpicture":imageUrl3,
              "aadharpicture2":imageUrl4,
              "usertype":widget.UserType,
              "updatestatus":"",
              "panno":printPannumbercontroller.text,
              "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              "time":DateFormat('hh:mm a').format(DateTime.now()),
              "timestamp":DateTime.now().millisecondsSinceEpoch,
              "count":true,
            });
            awesomeDialog("Success", "Submitted Your Data Successfully", 3);
            clearcontrollers();
          }
          else{
            FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
              "usageccount":FieldValue.increment(1),
              "walletamount":FieldValue.increment(-Total),
            });

            FirebaseFirestore.instance.collection("Reprint_document").doc(documentid).set({
              "name":printnamecontroller.text,
              "fathername":printfathernamecontroller.text,
              "dob":printdobcontroller.text,
              "gender":selectedValuegender,
              "village_town":printnameandvillagecontroller.text,
              "postoffice":printpostofficecontroller.text,
              "district":printdistrictcontroller.text,
              "state":printstatecontroller.text,
              "pincode":printpincodecontroller.text,
              "phoneno":printphonenumbercontroller.text,
              "Type":"Lost Pan card",
              "usertype":widget.UserType,
              "photo":imageUrl,
              "photo2":imageUrl5,
              "signpicture":imageUrl2,
              "aadharpicture":imageUrl3,
              "aadharpicture2":imageUrl4,
              "panno":printPannumbercontroller.text,
              "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              "time":DateFormat('hh:mm a').format(DateTime.now()),
              "timestamp":DateTime.now().millisecondsSinceEpoch,
              "count":true,
              "updatestatus":"",
            });
            FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Reprint_document")
                .doc(documentid).set({
              "name":printnamecontroller.text,
              "fathername":printfathernamecontroller.text,
              "dob":printdobcontroller.text,
              "gender":selectedValuegender,
              "village_town":printnameandvillagecontroller.text,
              "postoffice":printpostofficecontroller.text,
              "district":printdistrictcontroller.text,
              "state":printstatecontroller.text,
              "pincode":printpincodecontroller.text,
              "phoneno":printphonenumbercontroller.text,
              "Type":"Lost Pan card",
              "usertype":widget.UserType,
              "photo":imageUrl,
              "photo2":imageUrl5,
              "signpicture":imageUrl2,
              "aadharpicture":imageUrl3,
              "aadharpicture2":imageUrl4,
              "panno":printPannumbercontroller.text,
              "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              "time":DateFormat('hh:mm a').format(DateTime.now()),
              "timestamp":DateTime.now().millisecondsSinceEpoch,
              "count":true,
              "updatestatus":"",
            });
            awesomeDialog("Success", "Submitted Your Data Successfully", 3);
            clearcontrollers();
          }

        var sendnotification=await FirebaseFirestore.instance.collection("admin_token").get();
        for(int k=0;k<sendnotification.docs.length;k++){
          sendPushMessagefirebase( sendnotification.docs[k]['token'], widget.UserType.toString(),  "Lost Pan card");
        }
        FirebaseFirestore.instance.collection("AdminNotification").doc().set({
          "title":"Lost Pan card",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "content":"Lost Pan Card",
          "timestamp":DateTime.now().millisecondsSinceEpoch,
          "isviewed":false,
          "notifytype":widget.UserType
        });

        }
    }




  }


  sendPushMessagefirebase(String token, String body, String title) async {
    bool isSended = false;
    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'key=AAAAq3zlWIY:APA91bH9tz5y88MvJqqGI2FPCW_VQM5wL5ipvNdRMF7xHPGTZC5hEUXnbXSULjQLoD6M5I00TtwyNo7tXa69XMjTJNKAL6FlHwgn4LbP_NTfJS3yfA8PCNU9hY_3MRM3d-Tsdb8htpks',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSended = true;
      } else {
        isSended = false;
      }
    } catch (e) {
    }
    return isSended;
  }

  paymentfunction(){
    setState(() {
      FirebaseWalletAmount=0;
      normal_fees=0;
      Gst=0;
      Total=0;
    });
    if(double.parse(widget.UserWalletamount.toString())>156){
      setState(() {
        normal_fees=177;
        Gst=(0)*normal_fees;
        Total=normal_fees+Gst;
      });
      if(double.parse(widget.UserWalletamount.toString())-Total>0){
        print(double.parse(widget.UserWalletamount.toString())-Total);
        print("else Functionsssssssss");
        setState(() {
          FirebaseWalletAmount=double.parse(widget.UserWalletamount.toString())-Total;
        });
        print("FirebaseWalletAmount");
        print(FirebaseWalletAmount);
      }


    }


  }



  clearcontrollers(){
    setState(() {
       printPannumbercontroller.clear();
       printnamecontroller.clear();
       printfathernamecontroller.clear();
       printdobcontroller.clear();
       printnameandvillagecontroller.clear();
       printpostofficecontroller.clear();
       printdistrictcontroller.clear();
       printstatecontroller.clear();
       printpincodecontroller.clear();
       printphonenumbercontroller.clear();
      selectedValuegender='Select Gender';
      Loading=false;
      imageUrl='';
      imageUrl2='';
      imageUrl3='';
      imageUrl4='';
      imageUrl5='';
      _photo1=null;
      _photo2=null;
      _photo3=null;
      _photo4=null;
      _photo5=null;
    });
  }




}
