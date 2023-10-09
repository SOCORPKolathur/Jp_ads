import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({super.key});

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
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: 70,
        title: Text("Notification",
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
     StreamBuilder(
       stream: FirebaseFirestore.instance.collection("Notification").snapshots(),
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

           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               padding: const EdgeInsets.all(4.0),
             decoration: BoxDecoration(
                 color: Colors.grey.shade200,
               borderRadius: BorderRadius.circular(8)
             ),
               child: ListTile(
                 onTap: (){

                   Updatethestatusfunc(Notification.id);

                 },
                 style: ListTileStyle.drawer,
                 title: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       width:235,
                       child: Text(Notification['title'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                           fontSize: width/30,
                           color: Color(0xff8C8994)),),
                     ),
                     Stack(alignment: Alignment.topRight,
                       children: [
                         Column(
                           children: [
                             Text(Notification['date'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                 fontSize: width/30,
                                 color: Color(0xff8C8994)),),
                             Text(Notification['time'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                 fontSize: width/30,
                                 color: Color(0xff8C8994)),),
                           ],
                           crossAxisAlignment: CrossAxisAlignment.start,
                         ),
                         Notification['isviewed']==true?Icon(Icons.circle,color: Colors.red,size: 15,):SizedBox()
                       ],
                     ),
                   ],
                 ),
                 subtitle:
                 SizedBox(
                   height: 60,
                   width: 250,
                   child: Text("Content : ${Notification['content'].toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                       textStyle: TextStyle(
                           overflow: TextOverflow.ellipsis
                       ),
                       fontSize: width/30,
                       color: Color(0xff8C8994)),),
                 ),
               ),
             ),
           );
         },);
       },
     ),
    );
  }

  Updatethestatusfunc(docid){
    FirebaseFirestore.instance.collection("Notification").doc(docid).update({
      "isviewed":false
    });
  }


}
