import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notey_app/services/notification_services.dart';
import 'package:notey_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotificationHelper notificationHelper;
  @override
  void initState() {
    notificationHelper = NotificationHelper();

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    notificationHelper.initializeNotification();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const SafeArea(
          child: Center(
        child: Text("Home page"),
      )),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () async {
          debugPrint('tap');
          ThemeServices().switchTheme();
          await notificationHelper.displayNotification(
              title: 'Theme Changed', body: Get.isDarkMode ? "Activated Dark Mode" : "Activated Light Mode");
          await notificationHelper.scheduledNotification();
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: const [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
