import 'package:flutter/material.dart';

class RoughClipperAndPath extends StatelessWidget {
  const RoughClipperAndPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1, vertical: screenHeight * 0.03),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                // height: 40,
                height: screenHeight * 0.0517,
                // width: 200,
                decoration: BoxDecoration(
                  // color: Colors.purple,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: screenHeight * 0.0517,
                // width: 40,
                decoration: BoxDecoration(
                  color: Color(0xff35096D),
                ),
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
