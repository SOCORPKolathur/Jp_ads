import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_Page extends StatefulWidget {
  String?Userdocid;
   Notification_Page({this.Userdocid});

  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffF2F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: height/10.8,
        title: Text("Notification",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
              fontSize:width/22,
              color: Colors.white),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
      StreamBuilder(
       stream: FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Notification").orderBy("timestamp",descending: true).snapshots(),
       builder: (context, snapshot) {
         if(snapshot.hasData==null){
           return const Center(child: CircularProgressIndicator(),);
         }
         if(!snapshot.hasData){
           return const Center(child: CircularProgressIndicator(),);
         }
         return ListView.builder(
           shrinkWrap: true,
           physics:const BouncingScrollPhysics(),
           itemCount: snapshot.data!.docs.length,
           itemBuilder: (context, index) {

             var Notification=snapshot.data!.docs[index];

           return
             Container(
               margin: EdgeInsets.only(bottom: height/378,top: height/378),
               padding:  EdgeInsets.symmetric(
                 horizontal: width/90,
                 vertical: height/179
               ),
             decoration: BoxDecoration(
               border: Border(
                 bottom: BorderSide(
                   color: Colors.black
                 )
               ),
               color: Colors.white54.withOpacity(0.9),
             ),
               child: ListTile(
                 onTap: (){
                   Updatethestatusfunc(Notification.id);
                 },
                 title:SizedBox(

                   height:height/37.8,
                   width: width / .6,
                   child:
                   Padding(
                     padding:  EdgeInsets.only(left:width/180),
                     child: Text(
                       "${Notification['title']}",
                       style: GoogleFonts
                           .poppins(
                           color: Colors
                               .black,
                           textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                           fontSize:
                           width/24,
                           fontWeight:
                           FontWeight
                               .w600),
                     ),
                   ),
                 ),
                 subtitle:Column(
                   children: [
                     Row(
                       children: [

                         SizedBox(
                           width: width / 1.5,
                           child: Text(
                             " ${Notification["content"]}",
                             style: GoogleFonts
                                 .poppins(
                                 color: Colors
                                     .black54,textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                 fontSize:
                                 width/32.0,
                                 fontWeight:
                                 FontWeight
                                     .w600),

                           ),
                         ),

                       ],
                     ),
                     Padding(
                       padding:  EdgeInsets.only(left:width/160),
                       child: Row(
                         children: [

                           SizedBox(
                             height:height/50.4,
                             width: width /
                                 5.8,

                             child: Text(
                               "${Notification["date"]}",
                               style: GoogleFonts
                                   .poppins(
                                   color: Colors
                                       .black54,textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                   fontSize:
                                   width/36.0,
                                   fontWeight:
                                   FontWeight
                                       .w600),

                             ),
                           ),

                           SizedBox(
                             height:height/50.4,
                             width: width /
                                 4.6,

                             child: Text(
                               "- ${Notification["time"]}",
                               style: GoogleFonts
                                   .poppins(
                                   color: Colors
                                       .black54,
                                   fontSize:
                                   width/36.0,
                                   fontWeight:
                                   FontWeight
                                       .w600),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
                 trailing:Notification["isviewed"]==false? Container(
                   height: height /
                       33.48,
                   width:
                   width / 8.0,
                   //   "Outstanding", "Excellent", "Good","Satisfactory", "Focus Needed"
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.green),
                   child: Row(
                     mainAxisAlignment:
                     MainAxisAlignment
                         .spaceEvenly,
                     children: [

                       Text(
                         "New",
                         style: GoogleFonts
                             .poppins(
                             color: Colors
                                 .white,
                             fontSize:
                             width/27.69,
                             fontWeight:
                             FontWeight
                                 .w600),
                       ),
                     ],
                   ),
                 ):SizedBox(),




               ),
             );
         },);
       },
     ),
    );
  }

  Updatethestatusfunc(docid){
    FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Notification").doc(docid).update({
      "isviewed":true
    });
  }


}
