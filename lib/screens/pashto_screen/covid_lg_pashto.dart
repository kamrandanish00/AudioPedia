import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/custom_drawer.dart';
import 'package:lgs_audiopedia/common/custom_end_drawer.dart';
import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/village_counsel_pashto.dart';
import 'package:lgs_audiopedia/screens/village_counsel.dart';

class CovidLgPashto extends StatelessWidget {
  const CovidLgPashto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomEndDrawer(),
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
                Spacer(),
                Container(
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (ctx) => VillageCounselPashto()));
                        },
                        child: Image.asset(
                          'assets/lg_pashto.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => VillageCounselPashto()));
                        },
                        child: Image.asset(
                          'assets/covid_urdo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Image.asset(
                        'assets/general_urdo.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
