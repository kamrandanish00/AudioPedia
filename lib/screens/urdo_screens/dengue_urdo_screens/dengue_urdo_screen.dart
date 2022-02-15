import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/data/urdo_data/dengue_data_urdo.dart';
import 'package:lgs_audiopedia/model/topic.dart';
import 'package:lgs_audiopedia/screens/english_screens/introduction_local_government.dart';
import 'package:lgs_audiopedia/screens/english_screens/search_widget.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/model/topics_data_urdo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicsOfDengueUrdo extends StatefulWidget {
  const TopicsOfDengueUrdo({Key? key}) : super(key: key);

  @override
  State<TopicsOfDengueUrdo> createState() => _TopicsOfDengueUrdo();
}

class _TopicsOfDengueUrdo extends State<TopicsOfDengueUrdo> {
  List<Topic>? topics;
  String query = '';

  List<Topic> topicData = List.generate(
    dengueDataUrdo.length,
    (index) => Topic(
        id: dengueDataUrdo[index].id,
        title: dengueDataUrdo[index].title,
        description: dengueDataUrdo[index].description),
  );
  @override
  void initState() {
    super.initState();
    // topics = allTopics;
    topicData = dengueDataUrdo;
  }

  void searchBook(String query) {
    final books = dengueDataUrdo.where((book) {
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
                ' جنرل',
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
