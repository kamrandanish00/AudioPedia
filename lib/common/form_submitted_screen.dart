import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgs_audiopedia/screens/english_screens/choose_your_language.dart';
// import 'package:octo_boss/screens/user/Customer/customer_bottom_navigation_bar.dart';
// import 'package:octo_boss/screens/user/octoboss/octoboss_bottom_navigation_bar.dart';
// import 'package:octo_boss/screens/user/octoboss/octoboss_home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSubmittedScreen extends StatelessWidget {
  const FormSubmittedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final fontSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xffFF5A01),
          color: Color(0xff35016D),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: screenHeight * 0.15,
              ),
              Text(
                'Form Submitted\nSuccessfully',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize * 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).popUntil((dynamic) => false);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => ChooseYourLanguage()));
                },
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: screenHeight * 0.1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
