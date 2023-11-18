import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const_file.dart';

class Form_Page extends StatefulWidget {
  const Form_Page({super.key});

  @override
  State<Form_Page> createState() => _Form_PageState();
}

class _Form_PageState extends State<Form_Page> {
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
        title: Text("Form Page",
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
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Forms").orderBy("timestamp").snapshots(),
              builder:(context, snapshot) {

                if(snapshot.hasData==null){
                  return const Center(
                      child: CircularProgressIndicator()
                  );
                }

                if(!snapshot.hasData){
                  return const Center(
                      child: Text(
                          ""
                      )
                  );
                }

                return
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var Value=snapshot.data!.docs[index];

                      return GestureDetector(
                        onTap: () async {

                          //await  downloadFile(Value['Url'].toString(),Value['filename'].toString());
                           await launch(Value['Url']);
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: height/94.5,
                            horizontal: width/45
                          ),
                          child: Material(
                            elevation: 4,
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: height/8.4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white54,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(

                                      horizontal: width/36.0,
                                      vertical: height/75.6
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                            height:height/14.264,
                                            width: width/6.792,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:  BorderRadius.circular(8)
                                            ),
                                            child: Image.asset(pdfImage)
                                        ),
                                        SizedBox(width: width/27.428,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(Value['filename'].toString(), textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xff000000)),),
                                            Text(Value['date'].toString(),
                                              textAlign:  TextAlign.center,
                                              style: GoogleFonts.poppins(

                                                  color: const Color(0xff000000)),),

                                          ],
                                        )

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      );


                    },);
              }, ),

          ],
        ),
      ),


    );
  }


  downloadFile(String url,filename) async {
    Dio dio = Dio();
    try {
      // var dir = await getApplicationDocumentsDirectory();
      // await dio.download(url, "${dir.path}/${filename}.pdf", onReceiveProgress: (rec, total) async {
      //   print("Rec: $rec , Total: $total");
      //
      //   String filePath = '${dir.path}/${filename}.pdf';
      //   File videoFile = File(filePath);
      // });

      String? taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: '/storage/emulated/0/Download',
          fileName: '${filename}.pdf',
          showNotification: true,
          allowCellular: true,
          openFileFromNotification: true,
          saveInPublicStorage: true,
          requiresStorageNotLow: true
      );
      //await Share.shareFiles([(dir.path)]);

      return taskId; // Return the task ID

    } catch (e) {
    }
  }
}
