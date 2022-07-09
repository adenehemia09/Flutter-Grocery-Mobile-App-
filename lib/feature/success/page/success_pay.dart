import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/notification_model.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:grocery_mobile_app/feature/main/page/main_page.dart';

class SuccessPay extends StatefulWidget {
  const SuccessPay({Key? key}) : super(key: key);

  @override
  State<SuccessPay> createState() => _SuccessPayState();
}

class _SuccessPayState extends State<SuccessPay> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
        (route) => false,
      );
      newNotificationList.insert(
        0,
        const NotificationModel(
          icon: Icons.email,
          date: '7 juni, 24:00',
          messageType: 'Info',
          title: "Your order will be sent immediately by courier.",
          message:
              "Your order has been successful and will be sent by courier to your home.",
        ),
      );
    });
    context.read<PageCubit>().setPage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 5,
                      color: keyGreenColor,
                    )),
                child: const Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 70,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your order is\nsuccessfully done",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontWeight: bold, fontSize: 18, height: 1.3),
            ),
            Text(
              "You can track the delivery in the\n orders section.",
              textAlign: TextAlign.center,
              style: grayTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 14,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
