import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/screens/english_screens/choose_your_language.dart';
import 'package:lgs_audiopedia/screens/english_screens/choose_your_language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? curveAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);

    curveAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear);

    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => ChooseYourLanguage()));
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print('this is the height: $screenHeight');
    print('this is the height: $screenWidth');
    return Scaffold(
      backgroundColor: Color(0xff35016D),
      // body: Stack(
      //   children: [
      //     PositionedTransition(
      //       rect: RelativeRectTween(
      //         begin: RelativeRect.fromLTRB(50, 100, 50, 150),
      //         end: RelativeRect.fromLTRB(50, 0, 50, 100),
      //       ).animate(curveAnimation!),
      //       child: Container(
      //         // width: 120,
      //         // height: 120,
      //         child: Image(
      //           image: AssetImage('assets/logo.png'),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       // top: screenHeight * 0.9,
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       height: screenHeight * 0.1,
      //       child: Container(
      //         // height: screenHeight / 8,

      //         // width: double.infinity,
      //         // width: screenWidth,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //         ),
      //         child: Row(
      //           children: [
      //             //new logo of giz and lgs
      //             Expanded(
      //                 child: Container(child: Image.asset('assets/giz_lg.png')))
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      //
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              // width: 120,
              // height: 120,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //new logo of giz and lgs
                  Expanded(
                      child: Container(child: Image.asset('assets/giz_lg.png')))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//old splash screen which i used a plugin.
// AnimatedSplashScreen(
//       backgroundColor: Color(0xff35016D),
//       splash: 'assets/logo.png',
//       nextScreen: ChooseYourLanguage(),
//       // disableNavigation: true,
//       splashTransition: SplashTransition.sizeTransition,
//       // curve: Curves.bounceOut,
//       curve: Curves.bounceOut,
//     );

