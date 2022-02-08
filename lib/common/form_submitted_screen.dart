import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgs_audiopedia/screens/english_screens/choose_your_language.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class FormSubmittedScreen extends StatefulWidget {
  FormSubmittedScreen({Key? key, required this.trackingIdData})
      : super(key: key);
  List trackingIdData;

  @override
  State<FormSubmittedScreen> createState() => _FormSubmittedScreenState();
}

class _FormSubmittedScreenState extends State<FormSubmittedScreen> {
  //complaints list api
  var selectedProvince;
  List? complaintListData;

  Future getComplaints() async {
    String url = 'https://audiopedia.crispato.com/api/provinces.php';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);

      setState(() {
        complaintListData = jsonData;
      });
      print('This is Compliant list *********** $jsonData');
      return 'success';
    } catch (e) {
      return e;
    }
  }

  late Future<Complaints> futureComplaints;
  //fetching complaints
  Future<Complaints> fetchComplaints() async {
    final response = await http.get(Uri.parse(
        'https://audiopedia.crispato.com/api/complaintsearch.php?trackingID=1023'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Complaints.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  //
  @override
  void initState() {
    // futureComplaints = fetchComplaints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final fontSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xffFF5A01),
          color: Color(0xff35016D),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: screenHeight * 0.15,
              ),
              Text(
                'Complaint Submitted\nSuccessfully',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize * 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              // FutureBuilder<Complaints>(
              //   future: futureComplaints,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text(
              //           'Your Tracking ID: ${snapshot.data!.trackingId.toString()}');
              //     } else if (snapshot.hasError) {
              //       return Text('Snapshot has Error: ${snapshot.error}');
              //     }

              //     // By default, show a loading spinner.
              //     return const CircularProgressIndicator();
              //   },
              // ),
              SizedBox(height: screenHeight * 0.1),

              Builder(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can use the following tracking id to check your complaint status.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text('${widget.trackingIdData.first}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ],
                );
              }),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).popUntil((dynamic) => false);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => ChooseYourLanguage()));
                },
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: screenHeight * 0.1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//complaints model class
// To parse this JSON data, do
//
//     final complaints = complaintsFromJson(jsonString);

List<Complaints> complaintsFromJson(String str) =>
    List<Complaints>.from(json.decode(str).map((x) => Complaints.fromJson(x)));

String complaintsToJson(List<Complaints> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Complaints {
  Complaints({
    this.id,
    this.natureid,
    this.subnatureid,
    this.complaint,
    this.location,
    this.provenceid,
    this.districtid,
    this.tehsilid,
    this.attachfile,
    this.trackingId,
    this.status,
    this.feedback,
    this.feedbackstatus,
    this.contact,
    this.priority,
    this.userid,
  });

  String? id;
  String? natureid;
  String? subnatureid;
  String? complaint;
  String? location;
  String? provenceid;
  String? districtid;
  String? tehsilid;
  String? attachfile;
  String? trackingId;
  String? status;

  String? feedback;
  String? feedbackstatus;

  String? contact;
  String? priority;
  String? userid;

  factory Complaints.fromJson(Map<String, dynamic> json) => Complaints(
        id: json["id"],
        natureid: json["natureid"],
        subnatureid: json["subnatureid"],
        complaint: json["complaint"],
        location: json["location"],
        provenceid: json["provenceid"],
        districtid: json["districtid"],
        tehsilid: json["tehsilid"],
        attachfile: json["attachfile"],
        trackingId: json["trackingID"],
        status: json["status"],
        feedback: json["feedback"],
        feedbackstatus: json["feedbackstatus"],
        contact: json["contact"],
        priority: json["priority"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "natureid": natureid,
        "subnatureid": subnatureid,
        "complaint": complaint,
        "location": location,
        "provenceid": provenceid,
        "districtid": districtid,
        "tehsilid": tehsilid,
        "attachfile": attachfile,
        "trackingID": trackingId,
        "status": status,
        "feedback": feedback,
        "feedbackstatus": feedbackstatus,
        "contact": contact,
        "priority": priority,
        "userid": userid,
      };
}
