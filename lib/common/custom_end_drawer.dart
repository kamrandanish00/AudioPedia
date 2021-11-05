import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

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
                  Image.asset(
                    'assets/lg.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/covid19.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/general.png',
                    fit: BoxFit.contain,
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

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Color(0xffE8E8E8),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 25),
        child: Text(
          text!,
          style: TextStyle(fontSize: 14, color: Color(0xff6200EE)),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
