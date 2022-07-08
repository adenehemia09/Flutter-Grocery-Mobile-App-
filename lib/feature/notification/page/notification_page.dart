import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/notification/widget/notif_card.dart';
import 'package:grocery_mobile_app/data/notification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

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
          style: whiteTextStyle.copyWith(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: notificationModelList.map((e) {
            return CardNotif(
              messageType: e.messageType,
              title: e.title,
              message: e.message,
              date: e.date,
              icon: e.icon,
            );
          }).toList(),
        ),
      ),
    );
  }
}
