import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationInitialPage extends StatefulWidget {
  final NotificationAppLaunchDetails notificationAppLaunchDetails;
  NotificationInitialPage(
      {Key key, @required this.notificationAppLaunchDetails})
      : super(key: key);

  @override
  _NotificationInitialPageState createState() =>
      _NotificationInitialPageState();
}

class _NotificationInitialPageState extends State<NotificationInitialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification Initial'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.notificationAppLaunchDetails.payload ?? 'No payload')
          ],
        ),
      ),
    );
  }
}
