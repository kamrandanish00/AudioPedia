import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/screens/english_screens/Dengue_screens/tesil_counsel_dengue_eng.dart';

class VillageCounselDengue extends StatelessWidget {
  const VillageCounselDengue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Color(0xff35016D),
        body: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: height / 5.5),
          // height: ,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/villagecounsel.png',
            fit: BoxFit.fill,
          ),
        ),
        // SizedBox(height: 200),
        Positioned(
          // top: 30,
          child: Container(
            // height: 140,
            decoration: BoxDecoration(
              color: Color(0xff35016D),
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20)),
            ),
            child: Header(),
          ),
        ),
        Positioned(
          // top: height / 1.1445,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: height / 8,

            // width: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Color(0xff35016D),
              color: Colors.white,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(20),
              //   topRight: Radius.circular(20),
              // ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // height: height / 10,
                    child: Image.asset(
                      'assets/germanCooperation.png',
                    ),
                  ),
                ),
                // SizedBox(
                //   width: width / 100,
                // ),
                Expanded(
                  child: Container(
                    // height: height / 10,
                    child: Image.asset(
                      'assets/kpkgovernment.png',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.15,
          left: width * 0.3,
          right: width * 0.3,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => TehsilCounselDengueEng()));
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.05,
              width: width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // border: Border.all(
                //   color: Colors.white.withOpacity(0.15),
                // ),
                color: Color(0xff35016D),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}