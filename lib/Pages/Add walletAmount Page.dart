import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addwallet_Amount_Page extends StatefulWidget {
  String? Userid;
  addwallet_Amount_Page(this.Userid);

  @override
  State<addwallet_Amount_Page> createState() => _addwallet_Amount_PageState();
}

class _addwallet_Amount_PageState extends State<addwallet_Amount_Page> {

  TextEditingController Walletamountcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: 70,
        title: Text("Wallet Amount",
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
          SizedBox(
            height:100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wallet Amount",
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
                  child: TextField(
                    controller: Walletamountcontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(widget.Userid.toString()),
        ],
      ),
    );
  }
}
