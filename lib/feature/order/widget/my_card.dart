import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final double price;
  const MyCard({
    Key? key,
    required this.image,
    required this.title,
    required this.type,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: 'USD',
    );
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        width: MediaQuery.of(context).size.width - 48,
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          color: keyWhiteColor,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    image,
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
                    title,
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    type,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${format.currencySymbol} $price",
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
