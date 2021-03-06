import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgs_audiopedia/common/contact_drawer.dart';

import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/screens/english_screens/Dengue_screens/village_counsel_dengue.dart';
import 'package:lgs_audiopedia/screens/english_screens/lg_screens_english/village_counsel_lg_eng.dart';
import 'package:lgs_audiopedia/screens/english_screens/tehsil_counsel.dart';
import 'package:lgs_audiopedia/screens/english_screens/village_counsel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CovidLgs extends StatelessWidget {
  const CovidLgs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    Future exitDialog() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                // title: Text(
                //   AppLocalizations.of(context)!.are_you_sure,
                // ),
                content: Text(
                  AppLocalizations.of(context)!.do_you_want_to_exit,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff35016D)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.no,
                          )),
                      TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.yes,
                          )),
                    ],
                  )
                ],
              ));
    }

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
                                    builder: (ctx) => TehsilCounsel()));
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
              right: MediaQuery.of(context).size.height * 0.03,
              top: MediaQuery.of(context).size.height * 0.11,
              child: IconButton(
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            //go back
            Positioned(
              top: height * 0.11,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
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
