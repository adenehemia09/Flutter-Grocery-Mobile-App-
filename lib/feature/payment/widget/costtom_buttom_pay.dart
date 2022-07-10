import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:grocery_mobile_app/data/notification_model.dart';
import 'package:grocery_mobile_app/feature/transaction/page/transaction_page.dart';
import 'package:intl/intl.dart';

class CosttomButttomPay extends StatelessWidget {
  const CosttomButttomPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List dataPrice = myCardList.map((e) => e.price).toList();
    late List data = myCardList;

    double total = 0;
    var f = NumberFormat("###.0#", "en_US");

    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');

    for (var i = 0; i < data.length; i++) {
      total += (dataPrice[i] - (dataPrice[i] * 0.3));
    }
    return Container(
      padding: const EdgeInsets.all(18),
      height: 110,
      decoration: BoxDecoration(
        color: keyWhiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 13,
                ),
              ),
              Text(
                "${format.currencySymbol}${f.format(total + 25)}",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionPage(
                        totalPrice:
                            "${format.currencySymbol}${f.format(total + 25)}",
                      ),
                    ),
                  );
                  myCardList.clear();
                  newNotificationList.insert(
                    0,
                    const NotificationModel(
                      icon: Icons.update,
                      date: '7 juni, 24:00',
                      messageType: 'Info',
                      title: "Waiting for payment",
                      message:
                          "We need payment confirmation from you, please click the confirm button.",
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: keyGreenColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
