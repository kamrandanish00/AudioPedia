import 'package:flutter/material.dart';
import 'package:lgs_audiopedia/common/header.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff35016D),
            child: Header(),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Color(0xff35016D),
              ),
              Spacer(),
              Text(
                // 'Feedback Form',
                AppLocalizations.of(context)!.contact_us,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff35016D),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // 'Contact LG:',
                      AppLocalizations.of(context)!.contact_lg,
                    ),
                    Spacer(),
                    Text('(091) 9219015'),
                  ],
                ),
                Divider(
                  thickness: 2,
                  // indent: screenWidth * 0.11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // 'Contact NCOC:',
                      AppLocalizations.of(context)!.contact_ncoc,
                    ),
                    Spacer(),
                    Text('(091) 9211451'),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // 'Contact KP Health:',
                      AppLocalizations.of(context)!.contact_kp_healt,
                    ),
                    Spacer(),
                    Text('(091) 9210523'),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // 'Contact Health:',
                      AppLocalizations.of(context)!.contact_health,
                    ),
                    Spacer(),
                    Text('(091) 9212051'),
                  ],
                ),
                // Divider(
                //   thickness: 2,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
