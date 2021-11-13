import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/screens/english_screens/contact_details.dart';
import 'package:lgs_audiopedia/screens/english_screens/feedback_form.dart';

class ContactDrawer extends StatelessWidget {
  const ContactDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Color(0xff35016D),
        child: Column(
          children: [
            DrawerHeader(
              curve: Curves.easeIn,
              child: Container(
                // height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff35016D),
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => FeedbackForm()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.feedback,
                  color: Colors.white,
                ),
                title: Text(
                  'Feedback Form',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ContactDetails()));
              },
              leading: Icon(
                Icons.contact_page,
                color: Colors.white,
              ),
              title: Text(
                'Contact Details',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.room,
            //     color: Colors.white,
            //   ),
            //   title: Text(
            //     'Address',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
            //   title: Text(
            //     'Logout',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Spacer(
              flex: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Your #1 source for all the crossplatform devs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'by Kamran Ahmad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Privacy policy | Terms & Conditions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
