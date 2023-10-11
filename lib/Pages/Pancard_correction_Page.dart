
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/const_file.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class Pancard_correction_Page extends StatefulWidget {
  String ?Userdocid;
  String ?UserType;
  Pancard_correction_Page({this.Userdocid,this.UserType});

  @override
  State<Pancard_correction_Page> createState() => _Pancard_correction_PageState();
}

class _Pancard_correction_PageState extends State<Pancard_correction_Page> {


  String selectedValuegender='Select Gender';
  List<String>Gender=['Select Gender',"Male","Female","Transgender"];

int nameradiobutton=0;
int fathernameradiobutton=0;
int dobradiobutton=0;
int addressradiobutton=0;
int photoradiobutton=0;
int signatureradiobutton=0;
List Selectedradiovalue=[];

int ischeck=0;



TextEditingController Pannumbercontroller=TextEditingController();
TextEditingController corerctnamecontroller=TextEditingController();
TextEditingController corerctfathernamecontroller=TextEditingController();
TextEditingController corerctdobcontroller=TextEditingController();
TextEditingController corerctnameandvillagecontroller=TextEditingController();
TextEditingController corerctaddresscontroller=TextEditingController();
TextEditingController corerctdistrictcontroller=TextEditingController();
TextEditingController corerctstatecontroller=TextEditingController();
TextEditingController corerctpincodecontroller=TextEditingController();
TextEditingController corerctphonenumbercontroller=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
  setState(() {
    Selectedradiovalue.clear();
  });
    // TODO: implement initState
    super.initState();
  }

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
        title: Text("PAN Card-Correction",
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
      body:
     Form(
       key:_formKey ,
       child:
       Container(
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: Color(0xffffe09f)
         ),
         padding: EdgeInsets.only(left: width/36,right: width/36,top: height/37.8,bottom: height/37.8),
         child: SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 ///pan number
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Pan Number *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
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
                             FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                           ],
                           decoration: InputDecoration(
                             counterText: "",
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type pan number",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 ///correction container
                 Container(
                   height: height/2.16,
                   color: Colors.white,
                   margin: EdgeInsets.only(left:width/18,right: width/18,bottom: height/37.8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding:  EdgeInsets.symmetric(
                           vertical: height/94.5,
                           horizontal: width/45
                         ),
                         child: Row(
                           children: [
                             Text("Correction /Updates For  *",
                               textAlign: TextAlign.center,
                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/22,
                                   color: Colors.black),),
                             SizedBox(width: width/36.0,),
                             GestureDetector(
                               onTap: (){
                                 setState(() {
                                    nameradiobutton=0;
                                    fathernameradiobutton=0;
                                    dobradiobutton=0;
                                    addressradiobutton=0;
                                    photoradiobutton=0;
                                    signatureradiobutton=0;
                                    Selectedradiovalue.clear();
                                 });
                               },
                               child: Container(
                                 height: height/30.24,width: width/7.2,
                                 decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                   color: Color(0xff245BCA)
                                 ),
                                 child: Center(
                                   child: Text("Clear",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                         fontSize:width/26,
                                         color: Colors.white),),
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ),
                       SizedBox(height:height/75.6,),

                       ///name
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value:1,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: nameradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   nameradiobutton=val!;
                                 });
                                 if(nameradiobutton==1){
                                   print("nameradiobutton");
                                   setState(() {
                                     Selectedradiovalue.add("Name");
                                   });
                                 }
                                 else{
                                   print("else");
                                   setState(() {
                                     Selectedradiovalue.remove("Name");
                                   });

                                 }

                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Name",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),

                       ///father name
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value: 2,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: fathernameradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   fathernameradiobutton=val!;
                                 });
                                 if(val==2){
                                   setState(() {
                                     Selectedradiovalue.add("Father Name");
                                   });
                                 }
                                 else{
                                   setState(() {
                                     Selectedradiovalue.remove("Father Name");
                                   });

                                 }


                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Father Name",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),

                       ///dob name
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value: 3,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: dobradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   dobradiobutton=val!;
                                 });
                                 if(val==3){
                                   setState(() {
                                     Selectedradiovalue.add("Date Of Birth");
                                   });
                                 }
                                 else{
                                   setState(() {
                                     Selectedradiovalue.remove("Date Of Birth");
                                   });

                                 }

                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Date Of Birth",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),

                       ///Address
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value: 4,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: addressradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   addressradiobutton=val!;
                                 });
                                 if(val==4){
                                   setState(() {
                                     Selectedradiovalue.add("Address");
                                   });
                                 }
                                 else{
                                   setState(() {
                                     Selectedradiovalue.remove("Address");
                                   });

                                 }

                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Address",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),

                       ///Photo
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value: 5,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: photoradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   photoradiobutton=val!;
                                 });
                                 if(val==5){
                                   setState(() {
                                     Selectedradiovalue.add("Photo");
                                   });
                                 }
                                 else{
                                   setState(() {
                                     Selectedradiovalue.remove("Photo");
                                   });

                                 }


                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Photo",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),

                       ///Signature
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Radio(
                               value: 6,
                               activeColor: Colors.white,
                               focusColor: Colors.white,
                               groupValue: signatureradiobutton,
                               fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                               onChanged: (val){
                                 setState(() {
                                   signatureradiobutton=val!;
                                 });
                                 if(val==6){
                                   setState(() {
                                     Selectedradiovalue.add("Signature");
                                   });
                                 }
                                 else{
                                   setState(() {
                                     Selectedradiovalue.remove("Signature");
                                   });

                                 }

                               }),
                           Container(
                             height:height/18.9,
                             width:width/1.44,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(
                                         color: Colors.grey.shade300
                                     )
                                 )
                             ),
                             child: Padding(
                               padding:  EdgeInsets.only(top:height/63),
                               child: Text("Signature",
                                 textAlign: TextAlign.start,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/25,
                                     color: Colors.black),),
                             ),
                           ),


                         ],
                       ),






                     ],
                   ),
                 ),



                 ///Name
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Correct Name *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                           ],
                           controller: corerctnamecontroller,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type full name",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 ///Father name
                 SizedBox(
                   height:height/6.048,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Correct Father Name *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height: height/151.2,),
                       Text(Fathercondtiontxt,
                         textAlign: TextAlign.start,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/40,
                             color: Colors.black),),
                       SizedBox(height: height/151.2,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                           ],
                           controller: corerctfathernamecontroller,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type father name",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),

                 ///Date of birth
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Date of Birth *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           readOnly: true,
                           controller: corerctdobcontroller,
                           onTap: (){
                             Datepickerfunction(context);
                           },
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type date of birth",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),

                 ///Gender
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Gender *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
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
                               style: GoogleFonts.poppins(
                                 fontSize:width/25.714,
                                 color: Theme.of(context).hintColor,
                               ),
                             ),
                             items: Gender
                                 .map((String item) => DropdownMenuItem<String>(
                               value: item,
                               child: Text(
                                 item,
                                 style:  GoogleFonts.poppins(
                                   fontSize:width/25.714,
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
                                 _formKey.currentState!.validate();
                             },
                             buttonStyleData:  ButtonStyleData(
                               padding: EdgeInsets.symmetric(horizontal: 16),
                               height:height/18.9,
                               width: width/2.571,
                             ),
                             menuItemStyleData:  MenuItemStyleData(
                               height:height/18.9,
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),


                 ///Name of Promise
                 SizedBox(
                   height:height/6.048,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Name  Promises/Building/\nVillage/Town *",
                         textAlign: TextAlign.start,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLines: null,
                           controller: corerctnameandvillagecontroller,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type Village and more",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),

                 ///Road and more
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Road/Street/Lane/Post Office *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLines: null,
                           controller: corerctaddresscontroller,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type road and more",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 ///District
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("District *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLines: 1,
                           inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                           ],
                           controller: corerctdistrictcontroller,
                           keyboardType: TextInputType.name,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type District",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 ///State
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("State *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                          ],
                           controller: corerctstatecontroller,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type State name",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 ///Pin code
                 SizedBox(
                   height:height/7.56,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Pin Code *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLength: 6,
                           maxLines: 1,
                           inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                           ],
                           keyboardType:TextInputType.number,
                           controller: corerctpincodecontroller,
                           decoration: InputDecoration(
                               counterText: "",
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type pin code",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),

                 ///Phone number(Optiinally)
                 SizedBox(
                   height:130,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Phone Number(Optionally) *",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                             fontSize:width/22,
                             color: Colors.black),),
                       SizedBox(height:height/75.6,),
                       Container(
                         height:height/15.12,
                         width:width/1.2,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                                 color: Color(0xff353535)
                             )
                         ),
                         child: TextFormField(
                           maxLength: 10,
                           maxLines: 1,
                           inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                           ],
                           keyboardType:TextInputType.number,
                           controller: corerctphonenumbercontroller,
                           decoration: InputDecoration(
                             counterText: "",
                               contentPadding: EdgeInsets.only(left:width/18),
                               border: InputBorder.none,
                               hintText: "Type phone number",
                               hintStyle: GoogleFonts.poppins()
                           ),
                           validator: (value) => value!.isEmpty ? 'Field is required' : null,
                           onChanged: (_){
                             _formKey.currentState!.validate();
                           },
                         ),
                       )
                     ],
                   ),
                 ),


                 GestureDetector(
                   onTap: (){

                     print(Selectedradiovalue);
                     print(corerctpincodecontroller.text);
                     print(corerctphonenumbercontroller.text);
                      if (_formKey.currentState!.validate()&&Selectedradiovalue.isNotEmpty
                          &&corerctpincodecontroller.text.length==6&&corerctphonenumbercontroller.length==10) {

                        correctionpancardfunction();

                      }



                   },
                   child: Center(
                     child:
                     Container(
                       height:height/15.12,
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
              splashColor: Colors.black,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              colorScheme: ColorScheme.light(
                  primary: Color(0xff245BCA),
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??Text(""),
          );
        }
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      corerctdobcontroller.text =formattedDate;
    }
  }




  correctionpancardfunction() async {



    FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).get().then((value){
      if(value['usertype']=="Individual"){
        if(value['usageccount']<3){
          FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
            "usageccount":FieldValue.increment(1)
          });
          FirebaseFirestore.instance.collection("Correction_cards").doc().set({
            "pancardno":Pannumbercontroller.text,
            "correctionupdate":Selectedradiovalue,
            "Crtname":corerctnamecontroller.text,
            "crtfathername":corerctfathernamecontroller.text,
            "crtdate_of_birth":corerctdobcontroller.text,
            "crgender":selectedValuegender,
            "crtnameandbuildsno":corerctnameandvillagecontroller.text,
            "crtnadddress":corerctaddresscontroller.text,
            "crtdistrict":corerctdistrictcontroller.text,
            "crtstate":corerctstatecontroller.text,
            "crtpincode":corerctpincodecontroller.text,
            "crtphonenumber":corerctphonenumbercontroller.text,
            "usertype":widget.UserType,
            "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "time":DateFormat('hh:mm a').format(DateTime.now()),
            "timestamp":DateTime.now().millisecondsSinceEpoch
          });
          FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Correction_cards").doc().set({
            "pancardno":Pannumbercontroller.text,
            "correctionupdate":Selectedradiovalue,
            "Crtname":corerctnamecontroller.text,
            "crtfathername":corerctfathernamecontroller.text,
            "crtdate_of_birth":corerctdobcontroller.text,
            "crgender":selectedValuegender,
            "crtnameandbuildsno":corerctnameandvillagecontroller.text,
            "crtnadddress":corerctaddresscontroller.text,
            "crtdistrict":corerctdistrictcontroller.text,
            "crtstate":corerctstatecontroller.text,
            "crtpincode":corerctpincodecontroller.text,
            "crtphonenumber":corerctphonenumbercontroller.text,
            "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "time":DateFormat('hh:mm a').format(DateTime.now()),
            "timestamp":DateTime.now().millisecondsSinceEpoch
          });

          clearcontrollers();
          Succespopup();
        }
        else{
          planExitpopup();
        }
      }

      else{
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
          "usageccount":FieldValue.increment(1)
        });
        FirebaseFirestore.instance.collection("Correction_cards").doc().set({
          "pancardno":Pannumbercontroller.text,
          "correctionupdate":Selectedradiovalue,
          "Crtname":corerctnamecontroller.text,
          "crtfathername":corerctfathernamecontroller.text,
          "crtdate_of_birth":corerctdobcontroller.text,
          "crgender":selectedValuegender,
          "crtnameandbuildsno":corerctnameandvillagecontroller.text,
          "crtnadddress":corerctaddresscontroller.text,
          "crtdistrict":corerctdistrictcontroller.text,
          "crtstate":corerctstatecontroller.text,
          "crtpincode":corerctpincodecontroller.text,
          "usertype":widget.UserType,
          "crtphonenumber":corerctphonenumbercontroller.text,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Correction_cards").doc().set({
          "pancardno":Pannumbercontroller.text,
          "correctionupdate":Selectedradiovalue,
          "Crtname":corerctnamecontroller.text,
          "crtfathername":corerctfathernamecontroller.text,
          "crtdate_of_birth":corerctdobcontroller.text,
          "crgender":selectedValuegender,
          "crtnameandbuildsno":corerctnameandvillagecontroller.text,
          "crtnadddress":corerctaddresscontroller.text,
          "crtdistrict":corerctdistrictcontroller.text,
          "crtstate":corerctstatecontroller.text,
          "crtpincode":corerctpincodecontroller.text,
          "crtphonenumber":corerctphonenumbercontroller.text,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });

        clearcontrollers();
        Succespopup();
      }

    });



  }

  clearcontrollers(){
    setState(() {
       Pannumbercontroller.clear();
       corerctnamecontroller.clear();
       corerctfathernamecontroller.clear();
       corerctdobcontroller.clear();
       corerctnameandvillagecontroller.clear();
       corerctaddresscontroller.clear();
       corerctdistrictcontroller.clear();
       corerctstatecontroller.clear();
       corerctpincodecontroller.clear();
       corerctphonenumbercontroller.clear();
        nameradiobutton=0;
        fathernameradiobutton=0;
        dobradiobutton=0;
        addressradiobutton=0;
        photoradiobutton=0;
        signatureradiobutton=0;
        selectedValuegender='Select Gender';
    });
  }


  Succespopup() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return
          Padding(
            padding: EdgeInsets.only(
                left: width / 8.268,
                right: width / 8.845,
                top: height / 3.5,
                bottom: height / 3.5),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height/25.2,),

                      SizedBox(
                        height: height/7.56,
                        width: width/3.60,
                        child: Lottie.network(
                            "https://assets8.lottiefiles.com/private_files/lf30_nsqfzxxx.json"),
                      ),
                      SizedBox(height:height/75.6,),

                      Text(
                        "Submit Successfully....",
                        style: GoogleFonts.poppins(
                            fontSize: width / 25.613,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(height: height/12.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //cancel button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          ),

                          //okay button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Okay",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
      },
    );
  }

  planExitpopup() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return
          Padding(
            padding: EdgeInsets.only(
                left: width / 8.268,
                right: width / 8.845,
                top: height / 3.5,
                bottom: height / 3.5),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height/25.2,),

                      SizedBox(
                        // height: 150,
                        // width: 150,
                        child: Lottie.asset(Errrorlottie,fit: BoxFit.cover,height: 120,width: 120),
                      ),
                      SizedBox(height:height/75.6,),

                      Text(
                        "Exist Your  Free Apply....",
                        style: GoogleFonts.poppins(
                            fontSize: width / 25.613,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(height: height/12.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //cancel button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          ),

                          //okay button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Okay",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
      },
    );
  }


}
