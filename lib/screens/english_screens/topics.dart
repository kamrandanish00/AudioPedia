import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/english_screens/introduction_local_government.dart';
import 'package:lgs_audiopedia/screens/english_screens/search_widget.dart';
import 'package:lgs_audiopedia/screens/topics_data.dart';

class Topics extends StatefulWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  List<Topic>? topics;
  String query = '';

  List<Topic> topicData = List.generate(
    allTopics.length,
    (index) => Topic(
        id: allTopics[index].id,
        title: allTopics[index].title,
        description: allTopics[index].description),
  );
  @override
  void initState() {
    super.initState();
    // topics = allTopics;
    topicData = allTopics;
  }

  void searchBook(String query) {
    final books = allTopics.where((book) {
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
          hintText: 'Search Topic',
          onChanged: searchBook,
        );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    final fontSize = MediaQuery.of(context).textScaleFactor;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Path customPath = Path()
      ..moveTo(40, 1)
      ..lineTo(355, 1)
      ..lineTo(355, 51)
      ..lineTo(40, 51);
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
                  topicData[0].title,
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
              child: ListView.builder(
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
                  //               customPath: (size) => customPath, // PathBuilder
                  //               color: Colors.indigo,
                  //               dashPattern: [8, 4],
                  //               strokeWidth: 2,
                  //               child: Container(
                  //                 margin: EdgeInsets.only(left: 60, right: 40),
                  //                 alignment: Alignment.centerLeft,
                  //                 height: 50,
                  //                 width: 260,
                  //                 // color: Colors.green,
                  //                 child: Text(
                  //                   topicData[index].title,
                  //                   style: TextStyle(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Positioned(
                  //             child: ClipPath(
                  //               clipper: MyCustomClipper(),
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
                            builder: (ctx) => IntroductionToLocalGovernment(
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
                              alignment: Alignment.centerLeft,
                              // height: 40,
                              height: screenHeight * 0.14,
                              // width: 200,
                              decoration: BoxDecoration(
                                // color: Colors.purple,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Text(
                                topicData[index].title,
                                style: TextStyle(
                                  fontSize: fontSize * 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                // textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 52);
    path.lineTo(40, 52);
    path.lineTo(50, 26);
    path.lineTo(40, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
