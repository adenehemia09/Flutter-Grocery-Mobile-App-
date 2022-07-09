import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/notification/widget/notif_card.dart';
import 'package:grocery_mobile_app/data/notification_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List newNotif;
  @override
  void initState() {
    newNotif = newNotificationList.map((e) => e).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: keyGreenColor,
        title: Text(
          "Notifications",
          style: whiteTextStyle.copyWith(
            fontSize: 17,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                newNotificationList.clear();
                setState(() {
                  newNotif = newNotificationList.map((e) => e).toList();
                });
              },
              child: const Icon(
                Icons.delete,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: newNotificationList.map(
            (e) {
              return CardNotif(
                messageType: e.messageType,
                title: e.title,
                message: e.message,
                date: e.date,
                icon: e.icon,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
