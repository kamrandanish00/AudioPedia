import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgs_audiopedia/common/contact_drawer.dart';
import 'package:lgs_audiopedia/common/custom_drawer.dart';
import 'package:lgs_audiopedia/common/custom_end_drawer.dart';
import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/l10n/localization/provider/locale_provider.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/dengue_pashto_screen/dengue_pashto_screen.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/lg_pashto_topics_list.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/tehsil_counsel_pashto.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/village_counsel_pashto.dart';
import 'package:lgs_audiopedia/screens/english_screens/village_counsel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CovidLgPashto extends StatelessWidget {
  const CovidLgPashto({Key? key}) : super(key: key);

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
                // Spacer(),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (ctx) => VillageCounsel()));
                //   },
                //   child: BtnContainer(
                //     txt: 'LG',
                //   ),
                // ),
                // SizedBox(
                //   height: height * 0.04,
                // ),
                // BtnContainer(
                //   txt: 'COVID 19',
                // ),
                // Spacer(),
                Expanded(
                  child: Container(
                    height: height * 0.6,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final provider = Provider.of<LocaleProvider>(
                                context,
                                listen: false);
                            provider.setLocale(Locale('ps'));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => TopicsLGPashto()));
                          },
                          child: Image.asset(
                            'assets/lg_pashto.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            final provider = Provider.of<LocaleProvider>(
                                context,
                                listen: false);
                            provider.setLocale(Locale('ps'));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => TehsilCounselPashto()));
                          },
                          child: Image.asset(
                            'assets/covid_urdo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => TopicsOfDenguePashto()));
                          },
                          child: Image.asset(
                            'assets/general_urdo.png',
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
            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.11,
            //   child: IconButton(
            //     onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            //     icon: Icon(
            //       Icons.menu,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            //
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
                    ),
                  ),
                  // Spacer(),
                  IconButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
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
