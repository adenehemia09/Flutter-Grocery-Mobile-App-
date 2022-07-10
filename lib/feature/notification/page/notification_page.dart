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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2, microseconds: 500),
                    backgroundColor: keyTransparentColor,
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.70,
                      ),
                      padding: const EdgeInsets.all(
                        14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xffE2F4E9,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: keyGreenColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Success delete your notification",
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
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
        child: newNotificationList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "you don't have Notification",
                    style: blackTextStyle,
                  ),
                ),
              )
            : Column(
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
