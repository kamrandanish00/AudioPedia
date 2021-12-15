import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/lg_urdo_screens/topics_lg_urdo.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/topics_urdo.dart';

class CustomEndDrawerUrdo extends StatelessWidget {
  const CustomEndDrawerUrdo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.6,
      // height: 550,
      height: screenHeight * 0.7,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //lgs and covid
            Container(
              height: screenHeight * 0.7,
              width: screenWidth * 0.35,
              decoration: const BoxDecoration(
                color: Color(0xff35016D),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => TopicsLGUrdo()));
                    },
                    child: Image.asset(
                      'assets/lg_urdo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => TopicsUrdo()));
                    },
                    child: Image.asset(
                      'assets/covid_urdo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (ctx) => TopicsOfDengueEng()));
                    },
                    child: Image.asset(
                      'assets/general_urdo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
