import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    tz.initializeTimeZones();
    // ! IOS SETTINGS HERE
    // // final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    // //     requestSoundPermission: false,
    // //     requestBadgePermission: false,
    // //     requestAlertPermission: false,
    //     onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    // ! ANDROID SETTINGS HERE
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings("appicon");

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) {
      if (payload != null) {
        selectNotification(payload);
      }
    });
  }

  displayNotification({required String title, required String body}) async {
    debugPrint("doing test");
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );
    // ! We don't build to IOS Yet
    // var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //  iOS: iOSPlatformChannelSpecifics, //! Uncomment this if you want to build to IOS
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

  scheduledNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'theme changes 5 seconds ago',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        const NotificationDetails(android: AndroidNotificationDetails('your channel id', 'your channel name')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    } else {
      debugPrint("Notification Done");
    }
    //  Get.to(()=>SecondScreen(payload));
  }
}




// Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       //context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title),
//         content: Text(body),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SecondScreen(payload),
//                 ),
//               );
//             },
//           )
//         ],
//       ), context: null,
//     );
//   }
