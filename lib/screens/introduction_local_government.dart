// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/custom_end_drawer.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/feedback_form.dart';
import 'package:lgs_audiopedia/screens/test_audio_player.dart';
import 'package:lgs_audiopedia/screens/topics.dart';

class IntroductionToLocalGovernment extends StatefulWidget {
  //first it was like following and was working fine
  final Topic dataTopics;
  //testing to get list
  // final List<Topic> dataTopics;
  const IntroductionToLocalGovernment({
    Key? key,
    required this.dataTopics,
  }) : super(key: key);

  @override
  _IntroductionToLocalGovernmentState createState() =>
      _IntroductionToLocalGovernmentState();
}

class _IntroductionToLocalGovernmentState
    extends State<IntroductionToLocalGovernment> {
  // Topic? dataTopics;
  bool engSelected = false;
  bool urdoSelected = false;
  bool pashtoSelected = false;
  Color? engColor = Color(0xff35016D);
  final List<String> languages = ['English', 'Urdu', 'Pashto'];
  String? selectedlanguage = 'English';

  // AudioPlayer? advancedPlayer;

  // @override
  // void initState() {
  //   super.initState();
  //   advancedPlayer = AudioPlayer();
  // }
  AudioPlayer? advancedPlayer;

  @override
  void initState() {
    super.initState();
    advancedPlayer = new AudioPlayer();
    // print('this is the title value: $Widget');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    //custom path for dotted border
    Path customPath = Path()
      ..moveTo(40, 1)
      ..lineTo(355, 1)
      ..lineTo(355, 51)
      ..lineTo(40, 51);
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomEndDrawer(),
      // appBar: AppBar(),
      // body: Stack(
      //   children: [
      //     Column(
      //       children: [
      //         Container(
      //           decoration: BoxDecoration(
      //               // color: Color(0xff35016D),
      //               ),
      //           margin: EdgeInsets.only(
      //               top: MediaQuery.of(context).size.height * 0.04,
      //               bottom: MediaQuery.of(context).size.height * 0.03),
      //           alignment: Alignment.center,
      //           height: height * 0.1,
      //           // width: width * 0.5,
      //           width: double.infinity,
      //           child: Image.asset(
      //             'assets/logo.png',
      //             color: Color(0xff35016D),
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //         // Container(
      //         //   height: height * 0.05,
      //         //   width: width * 0.3,
      //         //   decoration: BoxDecoration(
      //         //     color: Color(0xff35016D),
      //         //     borderRadius: BorderRadius.circular(20),
      //         //   ),
      //         // )
      //         //dropdown
      //         // Container(
      //         //   height: height * 0.046,
      //         //   width: width * 0.3,
      //         //   alignment: Alignment.center,
      //         //   margin: EdgeInsets.only(left: width * 0.5, top: height * 0.0),
      //         //   decoration: BoxDecoration(
      //         //     borderRadius: BorderRadius.circular(15),
      //         //     color: Color(0xff35016D),
      //         //   ),
      //         //   child: DropdownButtonHideUnderline(
      //         //     child: DropdownButton<String>(
      //         //       icon: Padding(
      //         //         padding: EdgeInsets.only(left: width * 0.03),
      //         //         child: ImageIcon(
      //         //           AssetImage('assets/exchange.png'),
      //         //           color: Colors.white,
      //         //           size: 18,
      //         //         ),
      //         //       ),
      //         //       value: selectedlanguage,
      //         //       onChanged: (value) {
      //         //         setState(() {
      //         //           selectedlanguage = value;
      //         //         });
      //         //       },
      //         //       items: languages.map<DropdownMenuItem<String>>((value) {
      //         //         return DropdownMenuItem(
      //         //           child: Text(
      //         //             value,
      //         //             style: TextStyle(
      //         //               color: Colors.white,
      //         //             ),
      //         //           ),
      //         //           value: value,
      //         //         );
      //         //       }).toList(),
      //         //       dropdownColor: Colors.black,
      //         //     ),
      //         //   ),
      //         // ),

      //         Padding(
      //           padding: EdgeInsets.only(
      //             // right: 20,
      //             right: width * 0.05,
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     engSelected = true;
      //                     pashtoSelected = false;
      //                     urdoSelected = false;
      //                     // engColor = Color(0xff35016D);
      //                   });
      //                 },
      //                 child: Container(
      //                   height: height * 0.05,
      //                   width: width * 0.1,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       color: Color(0xff35016D),
      //                     ),
      //                     // color: Color(0xff35016D),
      //                     //new color when other lang is selected
      //                     color: engSelected ? engColor : Colors.white,
      //                   ),
      //                   child: Text(
      //                     'ENG',
      //                     style: TextStyle(
      //                       color:
      //                           engSelected ? Colors.white : Color(0xff35016D),
      //                       fontSize:
      //                           MediaQuery.of(context).textScaleFactor * 13,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     engSelected = false;
      //                     pashtoSelected = false;
      //                     urdoSelected = true;
      //                     // engColor = Colors.red;
      //                   });
      //                 },
      //                 child: Container(
      //                   height: height * 0.05,
      //                   width: width * 0.1,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     color:
      //                         urdoSelected ? Color(0xff35016D) : Colors.white,
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       color: Color(0xff35016D),
      //                     ),
      //                   ),
      //                   child: Text(
      //                     'اردو',
      //                     style: TextStyle(
      //                       fontSize:
      //                           MediaQuery.of(context).textScaleFactor * 13,
      //                       fontWeight: FontWeight.bold,
      //                       color:
      //                           urdoSelected ? Colors.white : Color(0xff35016D),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     pashtoSelected = true;
      //                     engSelected = false;
      //                     urdoSelected = false;
      //                   });
      //                 },
      //                 child: Container(
      //                   height: height * 0.05,
      //                   width: width * 0.1,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     color:
      //                         pashtoSelected ? Color(0xff35016D) : Colors.white,
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       color: Color(0xff35016D),
      //                     ),
      //                   ),
      //                   child: Text(
      //                     'پښتو',
      //                     style: TextStyle(
      //                       color: pashtoSelected
      //                           ? Colors.white
      //                           : Color(0xff35016D),
      //                       fontSize: 13,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: height * 0.018,
      //         ),
      //         //another app
      //         // Text(
      //         //   widget.dataTopics.title,
      //         //   // Widget.dataTopics,
      //         //   style: TextStyle(
      //         //     fontSize: 18,
      //         //     fontWeight: FontWeight.bold,
      //         //   ),
      //         //   textAlign: TextAlign.justify,
      //         // ),
      //         //new title with dotted border
      //         Center(
      //           child: Stack(
      //             children: [
      //               Positioned(
      //                 child: DottedBorder(
      //                   // padding: EdgeInsets.symmetric(horizontal: 20),
      //                   customPath: (size) => customPath, // PathBuilder
      //                   color: Colors.indigo,
      //                   dashPattern: [8, 4],
      //                   strokeWidth: 2,
      //                   child: Container(
      //                     //removed flexible from here on 12/11/2021 4:28 pm
      //                     margin: EdgeInsets.only(
      //                       // left: 60,
      //                       // right: 40,
      //                       left: width * 0.15,
      //                       right: width * 0.11,
      //                     ),
      //                     alignment: Alignment.centerLeft,
      //                     // height: 50,
      //                     // width: 260,
      //                     height: height * 0.058,
      //                     width: width * 0.65,
      //                     // color: Colors.green,
      //                     child: Text(
      //                       widget.dataTopics.title,
      //                       style: TextStyle(
      //                         fontSize:
      //                             MediaQuery.of(context).textScaleFactor * 15,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Positioned(
      //                 child: ClipPath(
      //                   clipper: MyCustomClipper(),
      //                   child: Container(
      //                       alignment: Alignment.center,
      //                       height: 52,
      //                       width: 50,
      //                       color: Color(0xff35096D),
      //                       child: Text(
      //                         widget.dataTopics.id.toString(),
      //                         style: TextStyle(
      //                           fontSize:
      //                               MediaQuery.of(context).textScaleFactor * 24,
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.white,
      //                         ),
      //                       )),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: height * 0.018,
      //         ),
      //         Expanded(
      //           child: Container(
      //             height: MediaQuery.of(context).size.height * 0.32,
      //             width: width * 0.9,
      //             margin: EdgeInsets.only(
      //                 bottom: MediaQuery.of(context).size.height * 0.03),
      //             child: SingleChildScrollView(
      //               child: Text(
      //                 // 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged.'
      //                 // 'It Was Popularised In The 1960S With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus Pagemaker Including Versions Of Lorem Ipsum.'
      //                 // 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make.'
      //                 // 'A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960S With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus Pagemaker Including Versions Of Lorem Ipsum.',
      //                 widget.dataTopics.description,
      //                 // widget.dataTopics.audioUrl!,
      //                 style: TextStyle(
      //                   fontSize: MediaQuery.of(context).textScaleFactor * 16,
      //                   color: Colors.black,
      //                 ),
      //                 textAlign: TextAlign.justify,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Column(
      //           // crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             TextAudioPlayer(audioPath: widget.dataTopics.audioUrl),
      //           ],
      //         ),
      //         SizedBox(
      //           height: height * 0.04,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Icon(
      //               Icons.arrow_left,
      //               // size: 40,
      //               size: height * 0.08,
      //               color: Color(0xff35096D),
      //             ),
      //             Expanded(
      //               child: SizedBox(
      //                 width: width * 0.5,
      //                 child: Text(
      //                   widget.dataTopics.title,
      //                   style: TextStyle(
      //                     color: Color(0xff35096D),
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: MediaQuery.of(context).textScaleFactor * 16,
      //                   ),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             ),
      //             IconButton(
      //               icon: Icon(
      //                 Icons.arrow_right,
      //                 size: height * 0.08,
      //               ),
      //               // size: 40,

      //               color: Color(0xff35096D),
      //               onPressed: () {
      //                 setState(() {
      //                   widget.dataTopics.id + 1;
      //                 });
      //               },
      //             )
      //           ],
      //         ),

      //         // Row(
      //         //   mainAxisAlignment: MainAxisAlignment.center,
      //         //   children: [
      //         //     Text(
      //         //       'Share this Article',
      //         //       style: TextStyle(
      //         //         fontSize: 18,
      //         //         fontWeight: FontWeight.bold,
      //         //       ),
      //         //     ),
      //         //     Icon(
      //         //       Icons.share_outlined,
      //         //       size: 35,
      //         //     )
      //         //   ],
      //         // ),
      //         SizedBox(
      //           height: height * 0.03,
      //         ),

      //         Text('Powered by @ IT Artificer k'),
      //       ],
      //     ),
      //     Positioned(
      //       top: height * 0.1,
      //       child: IconButton(
      //         onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      //         icon: Icon(Icons.menu),
      //         color: Color(0xff35016D),
      //       ),
      //     ),
      //   ],
      // ),

      ///new work with abdal ahmad
      body: SafeArea(
        child: PageView.builder(
          itemCount: widget.dataTopics.,
          itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Color(0xff35016D),
                        ),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04,
                        bottom: MediaQuery.of(context).size.height * 0.03),
                    alignment: Alignment.center,
                    height: height * 0.1,
                    // width: width * 0.5,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/logo.png',
                      color: Color(0xff35016D),
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Container(
                  //   height: height * 0.05,
                  //   width: width * 0.3,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xff35016D),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  // )
                  //dropdown
                  // Container(
                  //   height: height * 0.046,
                  //   width: width * 0.3,
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.only(left: width * 0.5, top: height * 0.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     color: Color(0xff35016D),
                  //   ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton<String>(
                  //       icon: Padding(
                  //         padding: EdgeInsets.only(left: width * 0.03),
                  //         child: ImageIcon(
                  //           AssetImage('assets/exchange.png'),
                  //           color: Colors.white,
                  //           size: 18,
                  //         ),
                  //       ),
                  //       value: selectedlanguage,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           selectedlanguage = value;
                  //         });
                  //       },
                  //       items: languages.map<DropdownMenuItem<String>>((value) {
                  //         return DropdownMenuItem(
                  //           child: Text(
                  //             value,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           value: value,
                  //         );
                  //       }).toList(),
                  //       dropdownColor: Colors.black,
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(
                      // right: 20,
                      right: width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              engSelected = true;
                              pashtoSelected = false;
                              urdoSelected = false;
                              // engColor = Color(0xff35016D);
                            });
                          },
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff35016D),
                              ),
                              // color: Color(0xff35016D),
                              //new color when other lang is selected
                              color: engSelected ? engColor : Colors.white,
                            ),
                            child: Text(
                              'ENG',
                              style: TextStyle(
                                color: engSelected
                                    ? Colors.white
                                    : Color(0xff35016D),
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              engSelected = false;
                              pashtoSelected = false;
                              urdoSelected = true;
                              // engColor = Colors.red;
                            });
                          },
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: urdoSelected
                                  ? Color(0xff35016D)
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff35016D),
                              ),
                            ),
                            child: Text(
                              'اردو',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 13,
                                fontWeight: FontWeight.bold,
                                color: urdoSelected
                                    ? Colors.white
                                    : Color(0xff35016D),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pashtoSelected = true;
                              engSelected = false;
                              urdoSelected = false;
                            });
                          },
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: pashtoSelected
                                  ? Color(0xff35016D)
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff35016D),
                              ),
                            ),
                            child: Text(
                              'پښتو',
                              style: TextStyle(
                                color: pashtoSelected
                                    ? Colors.white
                                    : Color(0xff35016D),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  //another app
                  // Text(
                  //   widget.dataTopics.title,
                  //   // Widget.dataTopics,
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   textAlign: TextAlign.justify,
                  // ),
                  //new title with dotted border
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          child: DottedBorder(
                            // padding: EdgeInsets.symmetric(horizontal: 20),
                            customPath: (size) => customPath, // PathBuilder
                            color: Colors.indigo,
                            dashPattern: [8, 4],
                            strokeWidth: 2,
                            child: Container(
                              //removed flexible from here on 12/11/2021 4:28 pm
                              margin: EdgeInsets.only(
                                // left: 60,
                                // right: 40,
                                left: width * 0.15,
                                right: width * 0.11,
                              ),
                              alignment: Alignment.centerLeft,
                              // height: 50,
                              // width: 260,
                              height: height * 0.058,
                              width: width * 0.65,
                              // color: Colors.green,
                              child: Text(
                                widget.dataTopics.title,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: ClipPath(
                            clipper: MyCustomClipper(),
                            child: Container(
                                alignment: Alignment.center,
                                height: 52,
                                width: 50,
                                color: Color(0xff35096D),
                                child: Text(
                                  widget.dataTopics.id.toString(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: width * 0.9,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.03),
                      child: SingleChildScrollView(
                        child: Text(
                          // 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged.'
                          // 'It Was Popularised In The 1960S With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus Pagemaker Including Versions Of Lorem Ipsum.'
                          // 'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make.'
                          // 'A Type Specimen Book. It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960S With The Release Of Letraset Sheets Containing Lorem Ipsum Passages, And More Recently With Desktop Publishing Software Like Aldus Pagemaker Including Versions Of Lorem Ipsum.',
                          widget.dataTopics.description,
                          // widget.dataTopics.audioUrl!,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextAudioPlayer(audioPath: widget.dataTopics.audioUrl),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.arrow_left,
                        // size: 40,
                        size: height * 0.08,
                        color: Color(0xff35096D),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: width * 0.5,
                          child: Text(
                            widget.dataTopics.title,
                            style: TextStyle(
                              color: Color(0xff35096D),
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          size: height * 0.08,
                        ),
                        // size: 40,

                        color: Color(0xff35096D),
                        onPressed: () {
                          setState(() {
                            widget.dataTopics.id + 1;
                          });
                        },
                      )
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Share this Article',
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.share_outlined,
                  //       size: 35,
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: height * 0.03,
                  ),

                  Text('Powered by @ IT Artificer k'),
                ],
              ),
              Positioned(
                top: height * 0.1,
                child: IconButton(
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(Icons.menu),
                  color: Color(0xff35016D),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
