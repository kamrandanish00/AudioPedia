import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lgs_audiopedia/common/custom_drawer.dart';
import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/english_screens/introduction_local_government.dart';
import 'package:lgs_audiopedia/screens/english_screens/search_widget.dart';
import 'package:lgs_audiopedia/screens/topics_data.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/model/topics_data_urdo.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/urdo_common/customClipperForUrdoPashto.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicsUrdo extends StatefulWidget {
  const TopicsUrdo({Key? key}) : super(key: key);

  @override
  State<TopicsUrdo> createState() => _TopicsUrdoState();
}

class _TopicsUrdoState extends State<TopicsUrdo> {
  List<Topic>? topics;
  String query = '';

  List<Topic> topicData = List.generate(
    allTopicsUrdo.length,
    (index) => Topic(
        id: allTopicsUrdo[index].id,
        title: allTopicsUrdo[index].title,
        description: allTopicsUrdo[index].description),
  );
  @override
  void initState() {
    super.initState();
    // topics = allTopics;
    topicData = allTopicsUrdo;
  }

  void searchBook(String query) {
    final books = allTopicsUrdo.where((book) {
      final titleLower = book.title.toLowerCase();
      // final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
      //  ||
      //     authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      // this.topics = books;
      this.topicData = books;
    });
  }

  Widget buildTopic(Topic topic) => TopicsBtnContainer(
        text: topic.title,
      );

  @override
  Widget build(BuildContext context) {
    Widget buildSearch() => SearchWidget(
          text: query,
          hintText: AppLocalizations.of(context)!.search_topics,
          onChanged: searchBook,
        );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    final fontSize = MediaQuery.of(context).textScaleFactor;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    // Path customPath = Path()
    //   ..moveTo(40, 1)
    //   ..lineTo(355, 1)
    //   ..lineTo(355, 51)
    //   ..lineTo(40, 51);
    //new path
    Path customPathUrdoPshto = Path()
      // ..moveTo(310, 1)
      // ..lineTo(10, 1)
      // ..lineTo(10, 51)
      // ..lineTo(310, 51);
      //responsive customPath
      ..moveTo(screenWidth * 0.72, screenHeight * 0.003)
      ..lineTo(screenWidth * 0.025, screenHeight * 0.003)
      ..lineTo(screenWidth * 0.025, screenHeight * 0.13)
      ..lineTo(screenWidth * 0.72, screenHeight * 0.13);

    return Scaffold(
      // key: _scaffoldKey,
      // drawer: CustomDrawer(),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Color(0xff35016D),
                ),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05),
            alignment: Alignment.center,
            height: screenHeight * 0.17,
            // width: width * 0.5,
            width: double.infinity,
            child: Image.asset(
              'assets/logo.png',
              color: Color(0xff35016D),
              fit: BoxFit.contain,
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.03),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Color(0xff35016D),
                  iconSize: screenHeight * 0.08,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.22,
              ),
              Text(
                // topicData[0].title,
                'کورونا وائرس',
                style: TextStyle(
                  fontSize: fontSize * 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff35016D),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          // Spacer(),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.02,
            // width: MediaQuery.of(context).size.width * 0.8,
            child: buildSearch(),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              width: double.infinity,
              child: topicData.isNotEmpty
                  ? ListView.builder(
                      // itemCount: topics!.length,
                      itemCount: topicData.length,
                      itemBuilder: (context, index) {
                        // final topic = topics![index];
                        final topic = topicData[index];

                        // return Padding(
                        //   padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //           builder: (ctx) => IntroductionToLocalGovernment(
                        //               dataTopics: topicData[index])));
                        //     },
                        //     child: Center(
                        //       child: Stack(
                        //         // fit: StackFit.passthrough,
                        //         children: [
                        //           Positioned(
                        //             child: DottedBorder(
                        //               // padding:
                        //               //     EdgeInsets.only(right: screenHeight * 0.03),
                        //               customPath: (size) =>
                        //                   customPathUrdoPshto, // PathBuilder
                        //               color: Colors.indigo,

                        //               dashPattern: [30, 0],
                        //               strokeWidth: 2,
                        //               child: Container(
                        //                 margin: EdgeInsets.only(
                        //                     left: screenWidth * 0.035,
                        //                     right: screenWidth * 0.2),
                        //                 alignment: Alignment.centerRight,
                        //                 // decoration: BoxDecoration(
                        //                 //   border: Border.all(color: Colors.black),
                        //                 // ),
                        //                 // height: 50,
                        //                 height: screenHeight * 0.122,

                        //                 // width: 260,
                        //                 width: screenWidth * 0.63,
                        //                 // color: Colors.green,
                        //                 child: Text(
                        //                   topicData[index].title,
                        //                   style: TextStyle(
                        //                     fontSize: fontSize * 14,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                   textAlign: TextAlign.right,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Positioned(
                        //             child: ClipPath(
                        //               clipper: CutomClipperforUrdoPashto(),
                        //               child: Container(
                        //                 margin: EdgeInsets.only(
                        //                     right: screenHeight * 0.03),
                        //                 alignment: Alignment.center,
                        //                 // height: 52,
                        //                 height: screenHeight * 0.14,
                        //                 // width: 52,
                        //                 width: screenWidth * 0.13,
                        //                 color: Color(0xff35096D),
                        //                 child: Text(
                        //                   topicData[index].id.toString(),
                        //                   style: TextStyle(
                        //                     fontSize: fontSize * 15,
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );

                        //new design for listview.builder
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.016),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) =>
                                      IntroductionToLocalGovernment(
                                          dataTopics: topicData[index])));
                            },
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    // height: screenHeight * 0.0517,
                                    // width: 40,
                                    height: screenHeight * 0.14,
                                    decoration: BoxDecoration(
                                      color: Color(0xff35096D),
                                    ),
                                    child: Text(
                                      topicData[index].id.toString(),
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
                                        horizontal: screenWidth * 0.02),
                                    alignment: Alignment.centerRight,
                                    // height: 40,
                                    height: screenHeight * 0.14,
                                    // width: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.purple,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Text(
                                      topicData[index].title,
                                      style: TextStyle(
                                        fontSize: fontSize * 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          // FittedBox(
          //   fit: BoxFit.contain,
          //   alignment: Alignment.topCenter,
          //   child: Text('Powered by @ IT Artificer'),
          // ),
          // Spacer(),
        ],
      ),
    );
  }
}

class TopicsBtnContainer extends StatelessWidget {
  final String? text;
  const TopicsBtnContainer({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => IntroductionToLocalGovernment()));
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.7,
        decoration: BoxDecoration(
          color: Color(0xff35016D),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/important-topics.png',
              fit: BoxFit.contain,
              height: height * 0.02,
            ),
            FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.none,
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            // SizedBox(
            //   width: width * 0.2,
            // ),
            // Spacer(),
            Image.asset(
              'assets/right-arrow.png',
              fit: BoxFit.contain,
              height: height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}

// class DataSearch extends SearchDelegate<String> {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     //actions for app bar
//     throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     //leading icon on hte left of the appp bar
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//    //show when someone searches for something
//     throw UnimplementedError();
//   }

// }

//mycustom clipper
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, 52);
//     path.lineTo(40, 52);
//     path.lineTo(50, 26);
//     path.lineTo(40, 0);
//     path.lineTo(0, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

//customclipper for urdopashto
///csutom clipper

// class CutomClipperforUrdoPashto extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // Path path = Path();
//     // path.lineTo(0, 52);
//     // path.lineTo(40, 52);
//     // path.lineTo(50, 26);
//     // path.lineTo(40, 0);
//     // path.lineTo(0, 0);
//     //clipper
//     Path path = Path();
//     // path.lineTo(52, 0);
//     // path.lineTo(52, 52);
//     // path.lineTo(0, 52);
//     // path.lineTo(-40, 26);
//     path.moveTo(50, 0);
//     path.lineTo(15, 0);
//     path.lineTo(4, 26);
//     path.lineTo(15, 52);
//     path.lineTo(50, 52);

//     // path.lineTo(50, 26);
//     // path.lineTo(40, 0);
//     // path.lineTo(0, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
