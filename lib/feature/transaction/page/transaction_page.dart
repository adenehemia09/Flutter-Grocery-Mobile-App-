import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:grocery_mobile_app/data/notification_model.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:grocery_mobile_app/feature/main/page/main_page.dart';
import 'package:grocery_mobile_app/feature/success/page/success_pay.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selesaikan pembayaran",
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            Text(
              "Batas Akhir Pembayaran",
              style: grayTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 13,
              ),
            ),
            Text(
              "Minggu, 10 Juli 2022 17:17",
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              //padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 0.2,
                  color: keyGrayColor,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                        color: keyGrayColor,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BNI Virtual Account",
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        const Image(
                          width: 60,
                          image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Bank%2Fbni-va.png?alt=media&token=9125f109-9f22-49f0-b9e4-31977ebaf1d3",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nomor Virtual Account",
                                  style: grayTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "8277085633348209",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Salin",
                                  style: greenTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.content_copy,
                                  size: 14,
                                  color: keyGreenColor,
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Pembayaran",
                                  style: grayTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${format.currencySymbol}${f.format(total + 25)}",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Lihat Detail",
                              style: greenTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                          (route) => false,
                        );
                        context.read<PageCubit>().setPage(2);
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 0.3,
                            color: keyGrayColor,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Status check",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessPay(),
                          ),
                          (route) => false,
                        );
                        newNotificationList.insert(
                          0,
                          const NotificationModel(
                            icon: Icons.lock,
                            date: '7 juni, 24:00',
                            messageType: 'Transaction',
                            title: "Successful transaction",
                            message:
                                "Your order has been successful and will be sent by courier to your home.",
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: keyGreenColor,
                        ),
                        child: Center(
                          child: Text(
                            "confirmation",
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
