import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jp_ads/const_file.dart';
import 'package:lottie/lottie.dart';



class Pandcard_apply_Page extends StatefulWidget {

  @override
  State<Pandcard_apply_Page> createState() => _Pandcard_apply_PageState();
}

class _Pandcard_apply_PageState extends State<Pandcard_apply_Page> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController fathernamecontroller=TextEditingController();
  TextEditingController dobcontroller=TextEditingController();
  String selectedValuepantype='Select Pan Type';
  List<String>pantype=['Select Pan Type',"Form 49A","Form 49AA"];
  String selectedValuegender='Select Gender';
  List<String>Gender=['Select Gender',"Male","Female","Transgender"];

  File? _photo1;
  File? _photo2;
  File? _photo3;
  String ?imageUrl;
  String ? imageUrl2;
  String ? imageUrl3;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
     // backgroundColor:  Color(0xffF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: 70,
        title:
        Text("Apply New PAN Card",
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
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [

            SizedBox(height: 50,),


            Form(
              key:_formKey ,
              child: Center(
                child:  SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 15,),

                      Text("New PAN Application  - 49 A",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/22,
                            color: Colors.black),),
                      SizedBox(height: 15,),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffffe09f)
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                        child: Column(
                            children: [

                              ///name
                              SizedBox(
                                height:100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Color(0xff353535)
                                          )
                                      ),
                                      child: TextFormField(
                                        controller: namecontroller,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                        ],
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 20),
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

                              ///pantype
                              SizedBox(
                                height:100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pan Type",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50,
                                      width: 300,
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
                                              fontSize: 14,
                                              color: Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: pantype
                                              .map((String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:  GoogleFonts.poppins(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                              .toList(),
                                          value: selectedValuepantype,
                                          validator: (value) => value=="Select Pan Type" ? 'Field is required' : null,
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedValuepantype = value!;
                                            });

                                            _formKey.currentState!.validate();
                                          },
                                          buttonStyleData: const ButtonStyleData(
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData: const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),


                              ///Father name
                              SizedBox(
                                height:100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Father Name",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Color(0xff353535)
                                          )
                                      ),
                                      child: TextFormField(
                                        controller: fathernamecontroller,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                        ],
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 20),
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
                                height:100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date of Birth",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Color(0xff353535)
                                          )
                                      ),
                                      child: TextFormField(
                                        controller: dobcontroller,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 20),
                                            border: InputBorder.none,
                                            hintText: "Type date of birth",
                                            hintStyle: GoogleFonts.poppins()
                                        ),
                                        validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                        onChanged: (_){
                                          _formKey.currentState!.validate();
                                        },
                                        onTap: (){
                                          Datepickerfunction(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),


                              ///Gender
                              SizedBox(
                                height:100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Gender",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50,
                                      width: 300,
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
                                              fontSize: 14,
                                              color: Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: Gender
                                              .map((String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:  GoogleFonts.poppins(
                                                fontSize: 14,
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
                                          buttonStyleData: const ButtonStyleData(
                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData: const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      )


                    ],
                  ),
                ),
              ),
            ),


            ///step-2
            Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),

                    ///Stepper Widget


                    SizedBox(height: 15,),

                    Text("Upload Documents",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize:width/22,
                          color: Colors.black),),
                    SizedBox(height: 15,),
                    Padding(
                      padding:  EdgeInsets.only(left: 25),
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
                    SizedBox(height: 15,),

                    GestureDetector(
                      onTap: (){
                        _uploadImage();
                      },
                      child: Container(
                        height: 100,
                       width: 320,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: Color(0xffFFFFFF),

                       ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              _photo1==null? Image.asset(Uploaddocimg):Image.file(_photo1!,height: 80,width: 80,fit: BoxFit.cover,),

                              _photo1==null?
                              Text("Upload File",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/26,
                                    color: Colors.black),):Text(""),

                        ]),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 180,
                      width: 320,
                      padding: EdgeInsets.all(10),
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
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),

                          ]),
                    ),

                    SizedBox(height: 15,),


                  ],
                ),
              ),
            ),

            ///step-3
            Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),

                    ///Stepper Widget


                    SizedBox(height: 15,),

                    Text("Upload Documents",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize:width/22,
                          color: Colors.black),),
                    SizedBox(height: 15,),
                    Padding(
                      padding:  EdgeInsets.only(left: 25),
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
                    SizedBox(height: 15,),

                    GestureDetector(
                      onTap: (){
                        _uploadImage2();
                      },
                      child: Container(
                        height: 100,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffFFFFFF)
                        ),

                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              _photo2==null? Image.asset(Uploaddocimg):Image.file(_photo2!,height: 80,width: 80,fit: BoxFit.cover,),

                              _photo2==null?
                              Text("Upload File",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/26,
                                    color: Colors.black),):Text(""),



                            ]),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 180,
                      width: 320,
                      padding: EdgeInsets.all(10),
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
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),

                          ]),
                    ),

                    SizedBox(height: 15,),


                  ],
                ),
              ),
            ),

            ///step-4
            Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),

                    ///Stepper Widget


                    SizedBox(height: 15,),

                    Text("Upload Documents",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                          fontSize:width/22,
                          color: Colors.black),),
                    SizedBox(height: 15,),
                    Padding(
                      padding:  EdgeInsets.only(left: 25),
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
                    SizedBox(height: 15,),

                    GestureDetector(
                      onTap: (){
                        _uploadImage3();
                      },
                      child: Container(
                        height: 100,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffFFFFFF)
                        ),

                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              _photo3==null? Image.asset(Uploaddocimg):Image.file(_photo3!,height: 80,width: 80,fit: BoxFit.cover,),

                              _photo3==null?
                              Text("Upload File",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize:width/26,
                                    color: Colors.black),):Text(""),


                            ]),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 180,
                      width: 320,
                      padding: EdgeInsets.all(10),
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
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.circle,size: 15,),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: 280,
                                  child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                      fontSize:width/28,
                                      color: Colors.black)),
                                )
                              ],
                            ),

                          ]),
                    ),

                    SizedBox(height: 15,),


                  ],
                ),
              ),
            ),


            GestureDetector(
              onTap: (){
                if (_formKey.currentState!.validate()) {
                  appiledpancardfunction();
                }
              },
              child: Center(
                child:
                Container(
                  height: 50,
                  width: 180,
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


          ],
        ),
      )
    );
  }

  _uploadImage() async {
    print("1111111111111111111111111111111111111111111111111111111111111111111");
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo1 = File(value.path);
        });
      }
    });

  }

  _uploadImage2() async {

    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo2 = File(value.path);
        });
      }
    });

  }

  _uploadImage3() async {

    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo3 = File(value.path);
        });
      }
    });

  }

  firebasestroragefunctionphoto() async {

    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo1.jpg");
    var uploadTask = await ref.putFile(_photo1!).catchError((error) async {

      print("error");
    });
     var image = await uploadTask.ref.getDownloadURL();
     setState(() {
       imageUrl=image;
     });

  }

  firebasestroragefunctionsign() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo2.jpg");
    var uploadTask = await ref.putFile(_photo2!).catchError((error) async {

      print("error");
    });
    var image2 = await uploadTask.ref.getDownloadURL();
    setState(() {
      imageUrl2=image2;
    });
    print(imageUrl2);

  }

  firebasestroragefunctionaadharcard() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo3.jpg");
    var uploadTask = await ref.putFile(_photo3!).catchError((error) async {

      print("error");
    });
    var image3 = await uploadTask.ref.getDownloadURL();
    setState(() {
      imageUrl3=image3;
    });
    print(imageUrl2);

    await FirebaseFirestore.instance.collection("New_applied").doc().set({
      "name":namecontroller.text,
      "pantype":selectedValuepantype,
      "father name":fathernamecontroller.text,
      "dob":dobcontroller.text,
      "gender":selectedValuegender,
      "photo":imageUrl,
      "updatestatus":"",
      "signpicture":imageUrl2,
      "aadharpicture":imageUrl3,
      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "time":DateFormat('hh:mm a').format(DateTime.now()),
      "timestamp":DateTime.now().millisecondsSinceEpoch
    });

    // FirebaseFirestore.instance..collection("Users").doc(widget.userid).collection("New_applied").doc().set({
    //   "name":namecontroller.text,
    //   "pantype":selectedValuepantype,
    //   "father name":fathernamecontroller.text,
    //   "dob":dobcontroller.text,
    //   "gender":selectedValuegender,
    //   "photo":imageUrl,
    //   "signpicture":imageUrl2,
    //   "aadharpicture":imageUrl3,
    //   "updatestatus":"",
    //   "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
    //   "time":DateFormat('hh:mm a').format(DateTime.now()),
    //   "timestamp":DateTime.now().millisecondsSinceEpoch
    // });

    setState(() {
      namecontroller.clear();
      fathernamecontroller.clear();
      dobcontroller.clear();
      selectedValuepantype='Select Pan Type';
      selectedValuegender='Select Gender';
      imageUrl='';
      imageUrl2='';
      imageUrl3='';

    });

  }


  appiledpancardfunction()  {

    firebasestroragefunctionphoto();
    firebasestroragefunctionsign();
    firebasestroragefunctionaadharcard();

    Succespopup();

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
                      SizedBox(height: 30,),

                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.network(
                            "https://assets8.lottiefiles.com/private_files/lf30_nsqfzxxx.json"),
                      ),
                      SizedBox(height: 10,),

                      Text(
                        "Submit Successfully....",
                        style: GoogleFonts.poppins(
                            fontSize: width / 25.613,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(height: 60,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //cancel button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 35,
                              width: 80,
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
                              height: 35,
                              width: 80,
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
  dobcontroller.text =formattedDate;
  }
}



}
