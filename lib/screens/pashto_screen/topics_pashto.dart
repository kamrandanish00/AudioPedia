import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lgs_audiopedia/Audiopedia_data/pashto_data.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/english_screens/introduction_local_government.dart';
import 'package:lgs_audiopedia/screens/english_screens/search_widget.dart';
import 'package:lgs_audiopedia/screens/english_screens/topics.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/urdo_common/customClipperForUrdoPashto.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicsPashto extends StatefulWidget {
  const TopicsPashto({Key? key}) : super(key: key);

  @override
  _TopicsPashtoState createState() => _TopicsPashtoState();
}

class _TopicsPashtoState extends State<TopicsPashto> {
  List<Topic>? topics;
  String query = '';

  List<Topic> topicData = List.generate(
    allTopicsPashto.length,
    (index) => Topic(
        id: allTopicsPashto[index].id,
        title: allTopicsPashto[index].title,
        description: allTopicsPashto[index].description),
  );
  @override
  void initState() {
    super.initState();
    // topics = allTopics;
    topicData = allTopicsPashto;
  }

  void searchBook(String query) {
    final books = allTopicsPashto.where((book) {
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
          // hintText: 'Search Topic',
          hintText: AppLocalizations.of(context)!.search_topics,

          onChanged: searchBook,
        );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    final fontSize = MediaQuery.of(context).textScaleFactor;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Path customPathUrdoPshto = Path()
      ..moveTo(330, 1)
      ..lineTo(20, 1)
      ..lineTo(20, 51)
      ..lineTo(330, 51);
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
                vertical: MediaQuery.of(context).size.height * 0.04),
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
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Color(0xff35016D),
                iconSize: screenHeight * 0.08,
              ),
              // SizedBox(
              //   width: screenWidth * 0.22,
              // ),
              // Spacer(),
              Expanded(
                // fit: BoxFit.contain,
                child: Text(
                  // topicData[0].title,
                  'کورونا وائرس',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor * 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff35016D),
                    // overflow: TextOverflow.clip,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Spacer(),
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
              width: double.infinity,
              child: topicData.isNotEmpty
                  ? ListView.builder(
                      // itemCount: topics!.length,
                      itemCount: topicData.length,
                      itemBuilder: (context, index) {
                        // final topic = topics![index];
                        final topic = topicData[index];

                        // return Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //           builder: (ctx) => IntroductionToLocalGovernment(
                        //               dataTopics: topicData[index])));
                        //     },
                        //     child: Center(
                        //       child: Stack(
                        //         children: [
                        //           Positioned(
                        //             child: DottedBorder(
                        //               // padding: EdgeInsets.symmetric(horizontal: 20),
                        //               customPath: (size) =>
                        //                   customPathUrdoPshto, // PathBuilder
                        //               color: Colors.indigo,
                        //               dashPattern: [8, 4],
                        //               strokeWidth: 2,
                        //               child: Container(
                        //                 margin: EdgeInsets.only(left: 40, right: 60),
                        //                 alignment: Alignment.centerRight,
                        //                 height: 50,
                        //                 width: 260,
                        //                 // color: Colors.green,
                        //                 child: Row(
                        //                   children: [
                        //                     // Spacer(),
                        //                     FittedBox(
                        //                       fit: BoxFit.contain,
                        //                       alignment: Alignment.centerRight,
                        //                       child: Text(
                        //                         topicData[index].title,
                        //                         style: TextStyle(
                        //                           fontSize: MediaQuery.of(context)
                        //                                   .textScaleFactor *
                        //                               15,
                        //                           fontWeight: FontWeight.bold,
                        //                           // locale: Locale('ur'),
                        //                         ),
                        //                         textAlign: TextAlign.right,
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Positioned(
                        //             child: ClipPath(
                        //               clipper: CutomClipperforUrdoPashto(),
                        //               child: Container(
                        //                   alignment: Alignment.center,
                        //                   height: 52,
                        //                   width: 50,
                        //                   color: Color(0xff35096D),
                        //                   child: Text(
                        //                     topicData[index].id.toString(),
                        //                     style: TextStyle(
                        //                       fontSize: 24,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Colors.white,
                        //                     ),
                        //                   )),
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
