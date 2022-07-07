import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: keyGreenColor,
        title: Text(
          "Notifications",
          style: whiteTextStyle.copyWith(fontSize: 17),
        ),
        centerTitle: true,
      ),
    );
  }
}
