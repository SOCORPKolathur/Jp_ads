import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Applied_Histroy extends StatefulWidget {
  String?usertype;
  Applied_Histroy({this.usertype});


  @override
  State<Applied_Histroy> createState() => _Applied_HistroyState();
}

class _Applied_HistroyState extends State<Applied_Histroy> with SingleTickerProviderStateMixin{

  bool viewdata=false;

  TabController?tabController;
  int selectTabIndex=0;

  @override
  void initState() {
    tabController=TabController(length: 3, vsync: this)  ;
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
        toolbarHeight: 70,
        title: Text("Apply Histroy",
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
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TabBar(
              controller: tabController,
              labelColor: Colors.indigo,
              dividerColor: Colors.transparent,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
              physics: BouncingScrollPhysics(),
              indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 0),
              labelPadding: const EdgeInsets.all(0),
              splashBorderRadius: BorderRadius.zero,
              splashFactory: NoSplash.splashFactory,
              labelStyle: GoogleFonts.openSans(
                fontSize: width/25.714,
                fontWeight: FontWeight.w800,
              ),
              unselectedLabelStyle: GoogleFonts.openSans(
                fontSize: width/22.5,
                fontWeight: FontWeight.w600,
              ),
              onTap: (index){
                setState(() {
                  selectTabIndex = index;
                });
              },
              tabs: [
                Tab(
                  child:  const Text("Applied"),
                ),
                Tab(
                  child: const Text("Correction"),
                ),
                Tab(
                  child: const Text("Wallet"),
                ),
              ],
            ),
            SizedBox(
              height:height/1.008,
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [

                  FutureBuilder(
                    future: FirebaseFirestore.instance.collection("Users").
                    doc(FirebaseAuth.instance.currentUser!.uid).collection("Histroy").where("Type",isEqualTo:"Applied").get(),
                    builder: (context, snapshot) {


                      if(!snapshot.hasError) {
                        switch(snapshot.connectionState){
                          case ConnectionState.none:
                            return const Center(child: CircularProgressIndicator(),);
                          case ConnectionState.waiting:
                            return const Center(child: CircularProgressIndicator(),);
                          default:
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                var applieddata = snapshot.data!.docs[index];

                                return GestureDetector(
                                  onTap: () {
                                    //name,fathername,gender,dob,pantype,updatestatus,date,time,type,aadharpicture,signpicture,photo)
                                    Applieddetailspopup(
                                      applieddata['name'].toString(),
                                      applieddata['father name'].toString(),
                                      applieddata['gender'].toString(),
                                      applieddata['dob'].toString(),
                                      applieddata['pantype'].toString(),
                                      applieddata['updatestatus'].toString(),
                                      applieddata['date'].toString(),
                                      applieddata['time'].toString(),
                                      applieddata['Type'].toString(),
                                      applieddata['aadharpicture'].toString(),
                                      applieddata['signpicture'].toString(),
                                      applieddata['photo'].toString(),

                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white54.withOpacity(0.9),
                                      elevation: 10,
                                      child: Container(
                                        height:height/7.56,
                                        width:width/1.125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white54.withOpacity(0.9),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Name : ${applieddata['name']
                                                        .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text(
                                                        "Farther Name: ${applieddata['father name']
                                                            .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,

                                                    child: Text("Date : ${applieddata['date']
                                                        .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Time : ${applieddata['time']
                                                        .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text(
                                                        "Status : ${applieddata['updatestatus']
                                                            .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Type : ${applieddata['Type']
                                                        .toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: applieddata['Type']
                                                                .toString() == "Applied"
                                                                ? Colors.green
                                                                : Colors.indigo))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },);
                        }
                      }

                      return const Center(child: CircularProgressIndicator(),);
                    },
                  ),

                  FutureBuilder(
                    future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).
                    collection("Histroy").where("Type",isEqualTo:"Correction").get(),
                    builder: (context, snapshot) {

                      if(snapshot.hasData==null){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(!snapshot.hasData){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(!snapshot.hasError) {
                        switch(snapshot.connectionState){
                          case ConnectionState.none:
                            return const Center(child: CircularProgressIndicator(),);
                          case ConnectionState.waiting:
                            return const Center(child: CircularProgressIndicator(),);
                          default:
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {

                                var applieddata=snapshot.data!.docs[index];
                                return GestureDetector(
                                  onTap: (){
                                    detailspopup(
                                      applieddata['Crtname'].toString(),
                                      applieddata['crtfathername'].toString(),
                                      applieddata['crtphonenumber'].toString(),
                                      applieddata['crgender'].toString(),
                                      applieddata['crtdate_of_birth'].toString(),
                                      applieddata['pancardno'].toString(),
                                      applieddata['crtnameandbuildsno'].toString(),
                                      applieddata['crtnadddress'].toString(),
                                      applieddata['crtdistrict'].toString(),
                                      applieddata['crtstate'].toString(),
                                      applieddata['date'].toString(),
                                      applieddata['time'].toString(),
                                      applieddata['updatestatus'].toString(),
                                      applieddata['correctionupdate'].toString(),
                                      applieddata['Type'].toString(),
                                      applieddata['crtpincode'].toString(),
                                    );
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(bottom:8.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white54.withOpacity(0.9),
                                      elevation: 10,
                                      child: Container(
                                        height:height/7.56,
                                        width:width/1.125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white54.withOpacity(0.9),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Name : ${applieddata['Crtname'].toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Phone no: ${applieddata['crtphonenumber'].toString()}",style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w500,
                                                        textStyle: TextStyle(
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                        color: Colors.black))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,

                                                    child: Text("Date : ${applieddata['date'].toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Time : ${applieddata['time'].toString()}",style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w500,
                                                        textStyle: TextStyle(
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                        color: Colors.black))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Status : ${applieddata['updatestatus'].toString()}",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w500,
                                                            textStyle: TextStyle(
                                                                overflow: TextOverflow.ellipsis
                                                            ),
                                                            color: Colors.black))),
                                                Container(
                                                    height:height/25.2,
                                                    width:width/2.4,
                                                    child: Text("Type : ${applieddata['Type'].toString()}",style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w500,
                                                        textStyle: TextStyle(
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                        color:applieddata['Type'].toString()=="Applied"?Colors.green:Colors.indigo))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },);
                        }
                      }

                      return const Center(child: CircularProgressIndicator(),);
                    },
                  ),

                  FutureBuilder(
                    future: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).
                    collection("Wallet_Histroy").get(),
                    builder: (context, snapshot) {

                      if(snapshot.hasData==null){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(!snapshot.hasData){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(!snapshot.hasError) {
                        switch(snapshot.connectionState){
                          case ConnectionState.none:
                            return const Center(child: CircularProgressIndicator(),);
                          case ConnectionState.waiting:
                            return const Center(child: CircularProgressIndicator(),);
                          default:
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {

                                var applieddata=snapshot.data!.docs[index];
                                return Padding(
                                  padding:  EdgeInsets.only(bottom:8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white54.withOpacity(0.9),
                                    elevation: 10,
                                    child: Container(
                                      height:height/7.56,
                                      width:width/1.125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white54.withOpacity(0.9),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,
                                                  child: Text("Name : ${applieddata['name'].toString()}",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w500,
                                                          textStyle: TextStyle(
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                          color: Colors.black))),
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,
                                                  child: Text("Phone no: ${applieddata['Phoneno'].toString()}",style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      textStyle: TextStyle(
                                                          overflow: TextOverflow.ellipsis
                                                      ),
                                                      color: Colors.black))),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,

                                                  child: Text("Date : ${applieddata['date'].toString()}",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w500,
                                                          textStyle: TextStyle(
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                          color: Colors.black))),
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,
                                                  child: Text("Time : ${applieddata['time'].toString()}",style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      textStyle: TextStyle(
                                                          overflow: TextOverflow.ellipsis
                                                      ),
                                                      color: Colors.black))),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,
                                                  child: Text("Amount : ${applieddata['Amount'].toString()}",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w500,
                                                          textStyle: TextStyle(
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                          color: Colors.black))),
                                              Container(
                                                  height:height/25.2,
                                                  width:width/2.4,
                                                  child: Text("Type : ${widget.usertype}",style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      textStyle: TextStyle(
                                                          overflow: TextOverflow.ellipsis
                                                      ),
                                                      color:Colors.green))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },);
                        }
                      }

                      return const Center(child: CircularProgressIndicator(),);
                    },
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  detailspopup(name,fathermname,phonenumber,gender,dob,panno,namebuildno,address,district,state,date,time,status,correctionlist,type,pincode)
  {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;

    return showDialog(context: context, builder: (context) {
      return  Padding(
        padding:  EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 40),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white54.withOpacity(0.9),
          elevation: 10,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            height: 600,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white54.withOpacity(0.9),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 5,),
                Text("Correction Details",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black)),
                SizedBox(height: 5,),
                Container(
                    height: 30,
                    width: 280,
                    child:
                    Text("Name : ${name}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            textStyle: TextStyle(
                                overflow: TextOverflow.ellipsis
                            ),
                            color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Father Name : ${fathermname}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            textStyle: TextStyle(
                                overflow: TextOverflow.ellipsis
                            ),
                            color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Phone no: ${phonenumber}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Gender: ${gender}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("DOB: ${dob}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Type: ${type}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Pan No: ${panno}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Name/Building No: ${namebuildno}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Address: ${address}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("District: ${district}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("State: ${state}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Pin Code: ${pincode}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Date/Time: ${date}-${time}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Status: ${status}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    width: 280,

                    child: Text("Correction List:\n ${correctionlist.toString()}",
                        style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,

                        color: Colors.black))),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(height: 30,
                  width: 100,
           decoration: BoxDecoration(
              color: Color(0xff263646),
             borderRadius: BorderRadius.circular(8)
           ),
                    child:Center(
                      child: Text("Okay",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/22,
                            color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
  }

  Applieddetailspopup(name,fathername,gender,dob,pantype,updatestatus,date,time,type,aadharpicture,signpicture,photo){

    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;

    return showDialog(context: context, builder: (context) {
      return  Padding(
        padding:  EdgeInsets.only(left: 20,right: 20,top: 80,bottom: 80),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white54.withOpacity(0.9),
          elevation: 10,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            height: 400,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white54.withOpacity(0.9),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 5,),
                Text("Applied Details",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            decoration: TextDecoration.underline,
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black)),
                SizedBox(height: 5,),
                Container(
                    height: 30,
                    width: 280,
                    child:
                    Text("Name : ${name}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            textStyle: TextStyle(
                                overflow: TextOverflow.ellipsis
                            ),
                            color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Father Name : ${fathername}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            textStyle: TextStyle(
                                overflow: TextOverflow.ellipsis
                            ),
                            color: Colors.black))),

                Container(
                    height: 30,
                    width: 280,
                    child: Text("Date/Time: ${date}-${time}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Gender: ${gender}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("DOB: ${dob}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Pantype: ${pantype}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Status: ${updatestatus}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Date/Time: ${date}-${time}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                Container(
                    height: 30,
                    width: 280,
                    child: Text("Type: ${type}",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                            overflow: TextOverflow.ellipsis
                        ),
                        color: Colors.black))),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                         image: DecorationImage(
                           image: NetworkImage(aadharpicture)
                         )
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(signpicture)
                          )
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo)
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xff263646),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:Center(
                      child: Text("Okay",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/22,
                            color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
  }



}
