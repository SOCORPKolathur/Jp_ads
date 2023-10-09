import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jp_ads/const_file.dart';
import 'package:lottie/lottie.dart';

class Reprint_Page extends StatefulWidget {
  const Reprint_Page({super.key});

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
        title: Text("Reprint PAN Card",
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
      body: Form(
        key:_formKey ,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffffe09f)
          ),
          padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ///pan number
                  SizedBox(
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pan Number *",
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
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/22,
                                color: Colors.black),
                            controller: printPannumbercontroller,
                            maxLength: 10,
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),

                            ],
                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.only(left: 20),
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

                  ///Name
                  SizedBox(
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Name *",
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                            ],
                            controller: printnamecontroller,
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


                  ///Father name
                  SizedBox(
                    height:125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Father Name *",
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                            ],
                            controller: printfathernamecontroller,
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
                        Text("Date of Birth *",
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
                            readOnly: true,
                            controller: printdobcontroller,
                            onTap: (){
                              Datepickerfunction(context);
                            },
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
                        Text("Gender *",
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
                                style: TextStyle(
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


                  ///Name of Promise
                  SizedBox(
                    height:125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Village/Town/ Locality *",
                          textAlign: TextAlign.start,
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
                            maxLines: null,
                            controller: printnameandvillagecontroller,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
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

                  ///Post Office
                  SizedBox(
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Post Office *",
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
                            maxLines: null,
                            controller: printpostofficecontroller,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                border: InputBorder.none,
                                hintText: "Type post office",
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
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("District *",
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
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                            ],
                            controller: printdistrictcontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                border: InputBorder.none,
                                hintText: "Type district name",
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
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("State *",
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
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                            ],
                            controller: printstatecontroller,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                border: InputBorder.none,
                                hintText: "Type state name",
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
                    height:100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pin Code *",
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
                            maxLength: 6,
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            ],
                            keyboardType:TextInputType.number,
                            controller: printpincodecontroller,
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.only(left: 20),
                                border: InputBorder.none,
                                hintText: "Type pincode",
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
                        Text("Applicant Phone Number *",
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
                            maxLength: 10,
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            ],
                            keyboardType:TextInputType.number,
                            controller: printphonenumbercontroller,
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.only(left: 20),
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
                      if (_formKey.currentState!.validate()&&printpincodecontroller.text.length==6&&printphonenumbercontroller.text.length==10) {
                       // reprintpancardfunction();
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
                          child:  Text("Next",
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
     printdobcontroller.text =formattedDate;
    }
  }




  reprintpancardfunction(){
    FirebaseFirestore.instance.collection("Correction_cards").doc().set({

      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "time":DateFormat('hh:mm a').format(DateTime.now()),
      "timestamp":DateTime.now().millisecondsSinceEpoch
    });
    clearcontrollers();
    Succespopup();
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


}
