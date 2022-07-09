import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:intl/intl.dart';

class ShippingDetitle extends StatelessWidget {
  const ShippingDetitle({Key? key}) : super(key: key);

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
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: keyWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Shipping Details",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Items",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
              Text(
                "${myCardList.length} Items",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total price",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
              Text(
                "${format.currencySymbol}${f.format(total)}",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping cost",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
              Text(
                "${format.currencySymbol}25.00",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment amount",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
              Text(
                "${format.currencySymbol}${f.format(total + 25)}",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
