import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/screens/choose_your_language.dart';

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
      duration: Duration(milliseconds: 400),
      vsync: this,
    )..repeat(reverse: true);

    curveAnimation = CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceInOut);

    // _animationController!.forward().then((value) {
    //   if (_animationController!.isCompleted) {
    //     _animationController!.reverse();
    //   } else if (_animationController!.isDismissed) {
    //     _animationController!.forward();
    //   } else {
    //     _animationController!.reverse();
    //   }
    // });

    // if (_animationController!.isCompleted) {
    //   _animationController!.reverse();
    // } else {
    //   _animationController!.reverse();
    // }
    Timer(Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
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
        body: Stack(
          children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromLTRB(50, 100, 50, 150),
                end: RelativeRect.fromLTRB(50, 0, 50, 100),
              ).animate(curveAnimation!),
              child: Container(
                // width: 120,
                // height: 120,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Positioned(
              // top: screenHeight * 0.9,
              bottom: 0,
              left: 0,
              right: 0,
              height: screenHeight * 0.1,
              child: Container(
                // height: screenHeight / 8,

                // width: double.infinity,
                // width: screenWidth,
                decoration: BoxDecoration(
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
                    //   width: screenWidth / 100,
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
          ],
        ));
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

