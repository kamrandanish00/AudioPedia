// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:lgs_audiopedia/common/custom_drawer.dart';
import 'package:lgs_audiopedia/common/custom_end_drawer.dart';
import 'package:lgs_audiopedia/common/header.dart';
import 'package:lgs_audiopedia/l10n/localization/provider/locale_provider.dart';
import 'package:lgs_audiopedia/main.dart';
import 'package:lgs_audiopedia/screens/english_screens/covid_lgs.dart';
import 'package:lgs_audiopedia/screens/pashto_screen/covid_lg_pashto.dart';
import 'package:lgs_audiopedia/screens/urdo_screens/covid_lg_urdo.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseYourLanguage extends StatefulWidget {
  const ChooseYourLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseYourLanguage> createState() => _ChooseYourLanguageState();
}

class _ChooseYourLanguageState extends State<ChooseYourLanguage> {
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

  @override
  void initState() {
    super.initState();

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           // channel.description,
    //           color: Colors.blue,
    //           playSound: true,
    //           // icon:
    //         )));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title!),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(notification.body!),
    //                 ],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  // void showNotification() {
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       'Testing notification',
  //       'how you doing ?',
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(
  //         channel.id,
  //         channel.name,
  //         // channel.description,
  //         importance: Importance.high,
  //         color: Colors.blue,
  //         playSound: true,
  //         // icon:
  //       )));
  // }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //fol localization
    final provider = Provider.of<LocaleProvider>(context, listen: true);
    // provider.setLocale(Locale('en'));
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,

      drawer: CustomEndDrawer(),

      backgroundColor: Color(0xff35016D),
      body: WillPopScope(
        onWillPop: () {
          exitDialog();
          return Future.value(false);
        },
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                Spacer(),
                GestureDetector(
                  // borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    // provider.setLocale(Locale('eng'));
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);
                    provider.setLocale(Locale('en'));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => CovidLgs()));
                  },
                  child: LanguageBtn(txt: 'ENG'),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                    onTap: () {
                      // for localization
                      final provider =
                          Provider.of<LocaleProvider>(context, listen: false);
                      provider.setLocale(Locale('ur'));
                      // provider.setLocale(Locale('ps'));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => CovidLgUrdo()));
                    },
                    child: LanguageBtn(txt: 'اردو')),
                SizedBox(
                  height: height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    provider.setLocale(Locale('ps'));
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => CovidLgPashto()));
                  },
                  child: LanguageBtn(
                    txt: 'پښتو',
                  ),
                ),
                Spacer(),
              ],
            ),
            Positioned(
              top: height * 0.11,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(Locale('en'));
                },
                icon: Icon(
                  Icons.menu,
                ),
                // alignment: Alignment.centerRight,
              ),
            ),
            // //go back
            // Positioned(
            //   top: height * 0.11,
            //   child: IconButton(
            //     color: Colors.white,
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: Icon(
            //       Icons.arrow_back_ios_new_rounded,
            //     ),
            //     alignment: Alignment.centerLeft,
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: showNotification,
      //   tooltip: 'show Notification',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class LanguageBtn extends StatelessWidget {
  final String txt;
  const LanguageBtn({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return CircleAvatar(
      radius: height * 0.075,
      backgroundColor: Colors.white,
      child: Container(
        height: height * 0.26,
        width: widht * 0.27,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xff35016D),
            width: 3,
          ),
        ),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xff35016D),
          ),
        ),
      ),
    );
  }
}
