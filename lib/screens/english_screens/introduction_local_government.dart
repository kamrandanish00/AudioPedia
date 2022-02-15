// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/custom_end_drawer.dart';
import 'package:lgs_audiopedia/l10n/localization/provider/locale_provider.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/english_screens/covid_lgs.dart';
import 'package:lgs_audiopedia/screens/english_screens/test_audio_player.dart';
import 'package:lgs_audiopedia/screens/english_screens/topics.dart';
import 'package:lgs_audiopedia/screens/english_screens/feedback_form.dart';
import 'package:lgs_audiopedia/screens/english_screens/test_audio_player.dart';
import 'package:lgs_audiopedia/screens/english_screens/topics.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/covid_lg_pashto.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/covid_lg_urdo.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/topics_urdo.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/urdo_common/CustomEndDrawerUrdo.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/urdo_common/customClipperForUrdoPashto.dart';
import 'package:provider/provider.dart';

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
    final fontSize = MediaQuery.of(context).textScaleFactor;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final locale = Provider.of<LocaleProvider>(context).locale;

    //custom path for dotted border
    Path customPath = Path()
      ..moveTo(40, 1)
      ..lineTo(355, 1)
      ..lineTo(355, 51)
      ..lineTo(40, 51);

    //custom path for urdo and pashto
    Path customPathUrdoPshto = Path()
      ..moveTo(330, 1)
      ..lineTo(20, 1)
      ..lineTo(20, 51)
      ..lineTo(330, 51);
    return Scaffold(
      key: _scaffoldKey,
      drawer:
          locale == Locale('en') ? CustomEndDrawer() : CustomEndDrawerUrdo(),

      ///new work with abdal ahmad
      body: SafeArea(
        child: PageView.builder(
            allowImplicitScrolling: true,
            physics: NeverScrollableScrollPhysics(),
            // itemCount: widget.dataTopics.,
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
                            top: MediaQuery.of(context).size.height * 0.022,
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

                      Padding(
                        padding: EdgeInsets.only(
                          // right: 20,
                          right: width * 0.05,
                          left: width * 0.05,
                        ),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         final provider = Provider.of<LocaleProvider>(
                        //             context,
                        //             listen: false);
                        //         provider.setLocale(Locale('en'));

                        //         Navigator.of(context).pushReplacement(
                        //             MaterialPageRoute(
                        //                 builder: (ctx) => CovidLgs()));
                        //       },
                        //       child: Container(
                        //         height: height * 0.05,
                        //         width: width * 0.1,
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //             color: Color(0xff35016D),
                        //           ),
                        //           // color: Color(0xff35016D),
                        //           //new color when other lang is selected
                        //           color: engSelected ? engColor : Colors.white,
                        //         ),
                        //         child: Text(
                        //           'ENG',
                        //           style: TextStyle(
                        //             color: engSelected
                        //                 ? Colors.white
                        //                 : Color(0xff35016D),
                        //             fontSize:
                        //                 MediaQuery.of(context).textScaleFactor *
                        //                     13,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         final provider = Provider.of<LocaleProvider>(
                        //             context,
                        //             listen: false);
                        //         provider.setLocale(Locale('ur'));
                        //         // setState(() {
                        //         //   engSelected = false;
                        //         //   pashtoSelected = false;
                        //         //   urdoSelected = true;
                        //         //   // engColor = Colors.red;
                        //         // });
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //             builder: (ctx) => CovidLgUrdo()));
                        //       },
                        //       child: Container(
                        //         height: height * 0.05,
                        //         width: width * 0.1,
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           color: urdoSelected
                        //               ? Color(0xff35016D)
                        //               : Colors.white,
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //             color: Color(0xff35016D),
                        //           ),
                        //         ),
                        //         child: Text(
                        //           'اردو',
                        //           style: TextStyle(
                        //             fontSize:
                        //                 MediaQuery.of(context).textScaleFactor *
                        //                     13,
                        //             fontWeight: FontWeight.bold,
                        //             color: urdoSelected
                        //                 ? Colors.white
                        //                 : Color(0xff35016D),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         final provider = Provider.of<LocaleProvider>(
                        //             context,
                        //             listen: false);
                        //         provider.setLocale(Locale('ps'));
                        //         // setState(() {
                        //         //   pashtoSelected = true;
                        //         //   engSelected = false;
                        //         //   urdoSelected = false;
                        //         // });
                        //         Navigator.of(context).pushReplacement(
                        //             MaterialPageRoute(
                        //                 builder: (ctx) => CovidLgPashto()));
                        //       },
                        //       child: Container(
                        //         height: height * 0.05,
                        //         width: width * 0.1,
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           color: pashtoSelected
                        //               ? Color(0xff35016D)
                        //               : Colors.white,
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //             color: Color(0xff35016D),
                        //           ),
                        //         ),
                        //         child: Text(
                        //           'پښتو',
                        //           style: TextStyle(
                        //             color: pashtoSelected
                        //                 ? Colors.white
                        //                 : Color(0xff35016D),
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                      SizedBox(
                        height: height * 0.018,
                      ),

                      //new design for listview.builder
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05, vertical: height * 0.016),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                // height: screenHeight * 0.0517,
                                // width: 40,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xff35096D),
                                ),
                                child: Text(
                                  widget.dataTopics.id.toString(),
                                  style: TextStyle(
                                    fontSize: fontSize * 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02),
                                alignment: locale == Locale('ur') ||
                                        locale == Locale('ps')
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                // height: 40,
                                height: height * 0.05,
                                // width: 200,
                                decoration: BoxDecoration(
                                  // color: Colors.purple,
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    widget.dataTopics.title,
                                    style: TextStyle(
                                      fontSize: fontSize * 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // textAlign: TextAlign.right,
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
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.32,
                          width: width * 0.9,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.03),
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
                              textAlign: locale == Locale('ur') ||
                                      locale == Locale('ps')
                                  ? TextAlign.right
                                  : TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      locale == Locale('ur') || locale == Locale('ps')
                          ? Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextAudioPlayer(
                                  audioPath: widget.dataTopics.audioUrl,
                                  txtContents: widget.dataTopics.description,
                                  title: widget.dataTopics.title,
                                ),
                              ],
                            )
                          : Container(),
                      // SizedBox(
                      //   height: height * 0.04,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Icon(
                      //       Icons.arrow_left,
                      //       // size: 40,
                      //       size: height * 0.08,
                      //       color: Color(0xff35096D),
                      //     ),
                      //     Expanded(
                      //       child: SizedBox(
                      //         width: width * 0.5,
                      //         child: Text(
                      //           widget.dataTopics.title,
                      //           style: TextStyle(
                      //             color: Color(0xff35096D),
                      //             fontWeight: FontWeight.bold,
                      //             fontSize:
                      //                 MediaQuery.of(context).textScaleFactor * 16,
                      //           ),
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       ),
                      //     ),
                      //     // IconButton(
                      //     //   icon: Icon(
                      //     //     Icons.arrow_right,
                      //     //     size: height * 0.08,
                      //     //   ),
                      //     //   // size: 40,

                      //     //   color: Color(0xff35096D),
                      //     //   onPressed: () {

                      //     //   },
                      //     // )
                      //     Icon(
                      //       Icons.arrow_right,
                      //       // size: 40,
                      //       size: height * 0.08,
                      //       color: Color(0xff35096D),
                      //     ),
                      //   ],
                      // ),

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

                      // Text('Powered by @ IT Artificer k'),
                    ],
                  ),
                  Positioned(
                    width: width * 0.99,
                    top: height * 0.11,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //go back
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            // Icons.arrow_back_ios_new_rounded,
                            Icons.arrow_back_ios,
                            color: Color(0xff35016D),
                          ),
                        ),
                        // Spacer(),
                        IconButton(
                          onPressed: () =>
                              _scaffoldKey.currentState!.openDrawer(),
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xff35016D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //go back
                  // Positioned(
                  //   top: height * 0.11,
                  //   child: IconButton(
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_back_ios_new_rounded,
                  //     ),
                  //     // alignment: Alignment.centerLeft,
                  //   ),
                  // ),
                ],
              );
            }),
      ),
    );
  }
}
