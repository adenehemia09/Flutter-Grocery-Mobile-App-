import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');
    return Center(
      child: Container(
        //height: 120,
        margin: const EdgeInsets.only(
          top: 15,
        ),
        width: MediaQuery.of(context).size.width - 48,
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          color: keyWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //Image
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fruits%2Fstrawberry-isolated-white-background-close-up.jpg?alt=media&token=13c791a9-d03e-45b6-b4e4-4516e34ed2ed",
                  ),
                ),
              ),
            ),
            // Keterangan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Strawberry",
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Fruits",
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${format.currencySymbol}4.55",
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        "/1Kg",
                        style: grayTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add Data
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: keyGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: keyWhiteColor,
                      size: 13,
                    ),
                  ),
                ),
                Text(
                  "1Kg",
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xffE2F4E9,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: keyGreenColor,
                      size: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
