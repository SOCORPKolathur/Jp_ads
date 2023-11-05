import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../const_file.dart';

class Minor_Page extends StatefulWidget {
  String ?Userdocid;
  String ?UserType;
  String ?UserWalletamount;
  int ?Usagecount;
  Minor_Page({this.Userdocid,this.UserType,this.UserWalletamount,this.Usagecount});

  @override
  State<Minor_Page> createState() => _Minor_PageState();
}

class _Minor_PageState extends State<Minor_Page> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController fathernamecontroller=TextEditingController();
  TextEditingController aadhaarontroller=TextEditingController();
  TextEditingController dobcontroller=TextEditingController();
  String selectedValuepantype='Select Pan Type';
  List<String>pantype=['Select Pan Type',"Individual","Distributor"];
  String selectedValuegender='Select Gender';
  List<String>Gender=['Select Gender',"Male","Female","Transgender"];

  File ?_photo1;
  File ?_photo2;
  File ?_photo3;
  File ?_photo4;
  File ?_photo5;
  File ?_photo6;
  File ?_photo7;
  String imageUrl="";
  String  imageUrl2="";
  String  imageUrl3="";
  String  imageUrl4="";
  String  imageUrl5="";
  String  imageUrl6="";
  String  imageUrl7="";
  int year=0;
  int month=0;
  int day=0;


  final _formKey = GlobalKey<FormState>();

  int steppervalue=0;

  bool Loading=false;
  bool imgaeSelcted=false;


  ///payment controller
  TextEditingController Usernamecontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();
  TextEditingController amountcontroller=TextEditingController();
  double normal_fees=0;
  double Gst=0;
  double Total=0;

  double FirebaseWalletAmount=0;


  @override
  void initState() {

    print("Hello");
    print(widget.Userdocid);
    checkusagecount();
    // TODO: implement initState
    super.initState();
  }

  checkusagecount()async{

    var document=await FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).get();
    if(document['usertype']=="Individual"){
      if(document['usageccount']==3){
        return  awesomeDialog("Warning....!", "Exist Your Free Apply",2);
      }
    }
    if(document['walletamount']<=157){
      return  awesomeDialog("Warning....!", 'Your Balance is Low Kindly Recharge Wallet Minimum Recharge Rs: 500',2);
    }
  }

  final RegExp _inputPattern = RegExp(r'^\d{4}\s\d{4}\s\d{4}$');


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor:  Color(0xffF2F6FF),
        appBar: AppBar(
          backgroundColor: Color(0xffF2F6FF),
          elevation: 0,
          toolbarHeight: height/10.8,
          title:
          Text("Minor PAN Card",
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
                      Color(0xff4E82EA),
                    ]
                )
            ),
          ),
        ),
        body:
        Stack(
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
                              width: steppervalue*width/5.8,
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
                                  Text("5.Parents\nAadhaar", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                      color:steppervalue>=4?Colors.green:Colors.black, fontSize: width/36.0),)
                                ],
                              ),
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
                                    Text("6",style: GoogleFonts.poppins(
                                        color:Colors.white
                                    ))),
                                  ),
                                  Text("6.Payment\n", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                      color:steppervalue>=4?Colors.green:Colors.black, fontSize: width/36.0),)
                                ],
                              ),

                            ],
                          ),
                        )


                      ],
                    ),


                    SizedBox(height: height/75.6),

                    StatefulBuilder(
                      builder: (context, setState) {
                        return SizedBox(
                          height: height/1.426,
                          child:
                          steppervalue==0?
                          SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(height: height/75.6,),

                                Text("New PAN Application  - 49 A",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/22,
                                      color: Colors.black),),
                                SizedBox(height: height/75.6,),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xffffe09f)
                                  ),
                                  padding: EdgeInsets.only(left: width/36.0,right: width/36.0,
                                      top: height/75.6,bottom: height/75.6),
                                  child: SingleChildScrollView(
                                    physics: const ScrollPhysics(),
                                    child: Column(
                                        children: [

                                          ///name
                                          SizedBox(
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Name",
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
                                                    controller: namecontroller,
                                                    textCapitalization: TextCapitalization.characters,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                                    ],
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

                                          ///pantype
                                          SizedBox(
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Pan Type",
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
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child: DropdownButtonFormField2<String>(
                                                      isExpanded: true,
                                                      hint: Text(
                                                        'Select Pan Type',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: width/25.714,
                                                          color: Theme.of(context).hintColor,
                                                        ),
                                                      ),
                                                      items: pantype
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
                                                      value: selectedValuepantype,
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          selectedValuepantype = value!;
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


                                          ///Father name
                                          SizedBox(
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Father Name",
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
                                                    controller: fathernamecontroller,
                                                    textCapitalization: TextCapitalization.characters,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                                    ],
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
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Date of Birth",
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
                                                    controller: dobcontroller,
                                                    textCapitalization: TextCapitalization.characters,
                                                    readOnly: true,
                                                    decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.only(left: width/18),
                                                        border: InputBorder.none,
                                                        hintText: "Type date of birth",
                                                        hintStyle: GoogleFonts.poppins()
                                                    ),
                                                    validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                                    onTap: () async {

                                                      DateTime? pickedDate = await showDatePicker(
                                                          context: context, initialDate: DateTime.now(),
                                                          firstDate: DateTime(1980), //DateTime.now() - not to allow to choose before today.
                                                          lastDate: DateTime.now()
                                                      );

                                                      if(pickedDate != null ){
                                                        //pickedDate output format => 2021-03-10 00:00:00.000
                                                        String formattedDate = DateFormat('dd - M - yyyy').format(pickedDate);
                                                        //formatted date output using intl package =>  2021-03-16
                                                        //you can implement different kind of Date Format here according to your requirement

                                                        setState(() {
                                                          year= pickedDate.year;
                                                          day= pickedDate.day;
                                                          month= pickedDate.month;
                                                          //set output date to TextField value.
                                                        });
                                                        DateTime birthday = DateTime(year, month, day);
                                                        DateDuration duration;
                                                        // Find out your age as of today's date 2021-03-08
                                                         duration = AgeCalculator.age(birthday);
                                                        print('Your age is $duration');// Your age is Years: 24, Months: 0, Days: 3
                                                      print("ageeeeeeeeeeeeeeeeeeeeeeeeeeee");

                                                      if(duration.years<18){
                                                        awesomeDialog("Your Are Minor","Kindly Apply to New Apply Pan card",1);
                                                      }
                                                      else{
                                                        dobcontroller.text =formattedDate;
                                                      }

                                                      }
                                                      else{
                                                        print("dfgdfg");
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),


                                          ///Gender
                                          SizedBox(
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Gender",
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
                                                        style: GoogleFonts.poppins(
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


                                          ///Aadhaar number
                                          SizedBox(
                                            height: height/8.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Aadhaar Number",
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
                                                      controller: aadhaarontroller,
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
                                                            return 'Enter the Aadhaar no correctly';
                                                          }
                                                        }
                                                      },
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height:height/35),
                                        ]),
                                  ),
                                ),
                                SizedBox(height: height/75.6,),


                              ],
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

                                                      await picker.pickImage(source: ImageSource.camera).then((value) {

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
                                                        setState((){});
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
                                                      setState((){});
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
                                      Text("4.Parents Aadhaar Card Upload",
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
                                                          .then((value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            _photo6 = File(value.path);
                                                          });
                                                          if(_photo6!=null&&_photo7!=null){
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
                                                            _photo6 = File(value.path);
                                                          });
                                                          if(_photo6!=null&&_photo7!=null){
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

                                          _photo6==null? Image.asset(Uploaddocimg):Image.file(_photo6!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                          _photo6==null?
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
                                                          .then((value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            _photo7 = File(value.path);

                                                          });
                                                          if(_photo6!=null&&_photo7!=null){
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
                                                            _photo7 = File(value.path);
                                                          });
                                                          if(_photo6!=null&&_photo7!=null){
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

                                          _photo7==null? Image.asset(Uploaddocimg):Image.file(_photo7!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                          _photo7==null?
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
                          steppervalue==5? SizedBox(
                              child:Column(
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

                                                      child: Text("GST :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                                  Container(
                                                      height: height/37.8,
                                                      width: width/4.5,

                                                      child: Text("₹ ${Gst.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

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
                              )
                          ):
                          const SizedBox(),
                        );
                      },),



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
                            else if(steppervalue==3){
                              setState(() {
                                _photo6=null;
                                _photo7=null;
                                imgaeSelcted=false;
                              });
                            }

                            print(steppervalue);
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

                        steppervalue==5?
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              Loading=true;
                            });
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
                              if (_formKey.currentState!.validate() &&
                                  selectedValuegender != "Select Gender" &&
                                  selectedValuepantype != "Select Pan Type" &&
                                  aadhaarontroller.text.length == 14) {
                                if (steppervalue < 5) {
                                  setState(() {
                                    steppervalue++;
                                    imgaeSelcted=false;
                                  });
                                }
                                if (steppervalue == 5) {
                                  paymentfunction();
                                }
                                if(steppervalue>0&&steppervalue<5) {
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

  awesomeDialog(title,description,errortype){
    return AwesomeDialog(
      dismissOnBackKeyPress: errortype==3?true:false,
      dismissOnTouchOutside:errortype==3? true:false,
      context: context,
      dialogType:errortype==1? DialogType.error:errortype==2?DialogType.warning:errortype==3?DialogType.success:DialogType.info,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {
        Navigator.pop(context);
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

  firebasestroragefunctionphoto() async {
    if(FirebaseWalletAmount>0){
      var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo1.jpg");
      var uploadTask = await ref.putFile(_photo1!);
      var image = await uploadTask.ref.getDownloadURL();
      setState(() {
        imageUrl=image;
      });

      var ref2 = FirebaseStorage.instance.ref().child('Images').child("$_photo2.jpg");
      var uploadTask2 = await ref2.putFile(_photo2!);
      var image2 = await uploadTask2.ref.getDownloadURL();
      setState(() {
        imageUrl2=image2;
      });

      var ref3 = FirebaseStorage.instance.ref().child('Images').child("$_photo3.jpg");
      var uploadTask3 = await ref3.putFile(_photo3!);
      var image3 = await uploadTask3.ref.getDownloadURL();
      setState(() {
        imageUrl3=image3;
      });

      var ref4 = FirebaseStorage.instance.ref().child('Images').child("$_photo4.jpg");
      var uploadTask4 = await ref4.putFile(_photo4!);
      var image4 = await uploadTask4.ref.getDownloadURL();
      setState(() {
        imageUrl4=image4;
      });

      var ref5 = FirebaseStorage.instance.ref().child('Images').child("$_photo5.jpg");
      var uploadTask5 = await ref5.putFile(_photo5!);
      var image5 = await uploadTask5.ref.getDownloadURL();
      setState(() {
        imageUrl5=image5;
      });
      var ref6 = FirebaseStorage.instance.ref().child('Images').child("$_photo6.jpg");
      var uploadTask6 = await ref6.putFile(_photo5!);
      var image6 = await uploadTask6.ref.getDownloadURL();
      setState(() {
        imageUrl6=image6;
      });
      var ref7 = FirebaseStorage.instance.ref().child('Images').child("$_photo7.jpg");
      var uploadTask7 = await ref7.putFile(_photo7!);
      var image7 = await uploadTask7.ref.getDownloadURL();
      setState(() {
        imageUrl7=image7;
      });

      if(widget.UserType=="Individual"){
        //Total
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
          "usageccount":FieldValue.increment(1),
          "walletamount":FieldValue.increment(-Total),
        });

        FirebaseFirestore.instance.collection("Minor_New_applied").doc().set({
          "name":namecontroller.text,
          "pantype":selectedValuepantype,
          "father name":fathernamecontroller.text,
          "aadhar no":aadhaarontroller.text,
          "dob":dobcontroller.text,
          "gender":selectedValuegender,
          "photo":imageUrl,
          "photo2":imageUrl5,
          "updatestatus":"Applied",
          "signpicture":imageUrl2,
          "aadharpicture":imageUrl3,
          "aadharpicture2":imageUrl4,
          "parentaadhaar1":imageUrl6,
          "parentaadhaar2":imageUrl7,
          "usertype":widget.UserType,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });

        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Histroy").
        doc().set({
          "name":namecontroller.text,
          "pantype":selectedValuepantype,
          "father name":fathernamecontroller.text,
          "aadhar no":aadhaarontroller.text,
          "dob":dobcontroller.text,
          "gender":selectedValuegender,
          "photo":imageUrl,
          "photo2":imageUrl5,
          "signpicture":imageUrl2,
          "aadharpicture":imageUrl3,
          "aadharpicture2":imageUrl4,
          "parentaadhaar1":imageUrl6,
          "parentaadhaar2":imageUrl7,
          "updatestatus":"",
          "Type":"Applied",
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });


        awesomeDialog("Success", "Submitted Your Data Successfully", 3);
        clearcontroller();


      }
      else{
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
          "usageccount":FieldValue.increment(1),
          "walletamount":FieldValue.increment(-Total),
        });
        FirebaseFirestore.instance.collection("Minor_New_applied").doc().set({
          "name":namecontroller.text,
          "pantype":selectedValuepantype,
          "father name":fathernamecontroller.text,
          "aadhar no":aadhaarontroller.text,
          "dob":dobcontroller.text,
          "gender":selectedValuegender,
          "photo":imageUrl,
          "photo2":imageUrl5,
          "updatestatus":"Applied",
          "signpicture":imageUrl2,
          "aadharpicture":imageUrl3,
          "aadharpicture2":imageUrl4,
          "parentaadhaar1":imageUrl6,
          "parentaadhaar2":imageUrl7,
          "usertype":widget.UserType,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Histroy").doc()
            .set({
          "name":namecontroller.text,
          "pantype":selectedValuepantype,
          "father name":fathernamecontroller.text,
          "aadhar no":aadhaarontroller.text,
          "dob":dobcontroller.text,
          "gender":selectedValuegender,
          "photo":imageUrl,
          "photo2":imageUrl5,
          "signpicture":imageUrl2,
          "aadharpicture":imageUrl3,
          "aadharpicture2":imageUrl4,
          "parentaadhaar1":imageUrl6,
          "parentaadhaar2":imageUrl7,
          "updatestatus":"",
          "Type":"Applied",
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });
        awesomeDialog("Success", "Submitted Your Data Successfully", 3);
        clearcontroller();
      }

    }


  }





  clearcontroller(){
    setState(() {
      namecontroller.clear();
      fathernamecontroller.clear();
      dobcontroller.clear();
      aadhaarontroller.clear();
      selectedValuepantype='Select Pan Type';
      selectedValuegender='Select Gender';
      imageUrl='';
      imageUrl2='';
      imageUrl3='';
      imageUrl4='';
      imageUrl5='';
      imageUrl6='';
      imageUrl7='';
      _photo1=null;
      _photo2=null;
      _photo3=null;
      _photo4=null;
      _photo5=null;
      _photo6=null;
      _photo7=null;
      Loading=false;

    });
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
        normal_fees=250;
        Gst=(18/100)*normal_fees;
        Total=normal_fees+Gst;
      });
      if((double.parse(widget.UserWalletamount.toString())-Total).isNegative){
        print(double.parse(widget.UserWalletamount.toString())-Total);
        return awesomeDialog("Low Wallet Amount", "Please Recharge Wallet Amount",1);
      }
      else{
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


  }



}
