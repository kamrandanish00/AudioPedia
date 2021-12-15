import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/contact_drawer.dart';

import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/screens/english_screens/Dengue_screens/village_counsel_dengue.dart';
import 'package:lgs_audiopedia/screens/english_screens/lg_screens_english/village_counsel_lg_eng.dart';
import 'package:lgs_audiopedia/screens/english_screens/village_counsel.dart';

class CovidLgs extends StatelessWidget {
  const CovidLgs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: ContactDrawer(),
        backgroundColor: Color(0xff35016D),
        body: Stack(
          children: [
            Column(
              children: [
                Header(),

                Expanded(
                  child: Container(
                    height: height * 0.6,
                    width: width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => VillageCounselLGEng()));
                          },
                          child: Image.asset(
                            'assets/lg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => VillageCounsel()));
                          },
                          child: Image.asset(
                            'assets/covid19.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => VillageCounselDengue()));
                          },
                          child: Image.asset(
                            'assets/general.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.11,
              child: IconButton(
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}

class BtnContainer extends StatelessWidget {
  final String? txt;
  const BtnContainer({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.14,
        minWidth: screenWidth * 0.3,
      ),
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.46,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            // minHeight: screenHeight * 0.05,
            maxHeight: screenHeight * 0.03,
          ),
          // height: 50,
          height: screenHeight * 0.01,
          // width: 180,
          // width: screenWidth * 0.45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
              )
              // borderRadius: BorderRadius.circular(15),
              ),
          child: FittedBox(
            child: Text(
              txt!,
              style: TextStyle(
                color: Color(0xff35016D),
                fontSize: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
