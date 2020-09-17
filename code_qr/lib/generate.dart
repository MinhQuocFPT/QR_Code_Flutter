import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GeneratePageState();
  }
}

class GeneratePageState extends State<GeneratePage> {
  int count = 1;
  String qrString = 'Yh8Tm+M57RGSm8dUBHubYvc41LVOMNIshJt/qhnpC//cvS+Q3zS+OoNv+agupsOJtNC3tt45/VPAuHwFBSoByw==';
  String dataQR='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds:1), (time) async{
      count++;
      // ignore: unnecessary_statements
      dataQR = qrString + '$count';
      setState(() {
        qrString= dataQR;
      });
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('QR generate'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              QrImage(
                data: qrString,
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   "New QR Link Generator",
              //   style: TextStyle(fontSize: 20.0),
              // ),
              // TextField(
              //   controller: qrdataFeed,
              //   decoration: InputDecoration(
              //     hintText: "Input your link or data",
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              //   child: FlatButton(
              //     padding: EdgeInsets.all(15.0),
              //     onPressed: () async {
              //       if (qrdataFeed.text.isEmpty) {
              //         //a little validation for the textfield
              //         setState(() {
              //           qrString = "";
              //         });
              //       }
              //       else {
              //         setState(() {
              //           qrString = qrdataFeed.text;
              //         }
              //         );
              //       }
              //     },
              //     child: Text(
              //       "Generate QR",
              //       style: TextStyle(
              //           color: Colors.blue, fontWeight: FontWeight.bold),
              //     ),
              //     shape: RoundedRectangleBorder(
              //         side: BorderSide(color: Colors.blue, width: 3.0),
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  // final qrdataFeed = TextEditingController();
}
