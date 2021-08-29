part of 'pages.dart';

class NotificationsPages extends StatefulWidget {
  const NotificationsPages({Key key}) : super(key: key);

  @override
  _NotificationsPagesState createState() => _NotificationsPagesState();
}

class _NotificationsPagesState extends State<NotificationsPages> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardNotifWidget(baru: true),
        CardNotifWidget(baru: false),
      ],
    );
  }
}
