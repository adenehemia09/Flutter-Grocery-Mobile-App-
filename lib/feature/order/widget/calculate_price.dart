import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:intl/intl.dart';

class CalculatePrice extends StatelessWidget {
  const CalculatePrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    double diskon = 0;
    double total = 0;
    List data = myCardList.map((e) => e.price).toList();
    var f = NumberFormat("###.0#", "en_US");

    for (var i = 0; i < data.length; i++) {
      sum += data[i];
    }
    for (var i = 0; i < data.length; i++) {
      diskon += (data[i] * 0.3);
    }

    for (var i = 0; i < data.length; i++) {
      total += (data[i] - (data[i] * 0.3));
    }

    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: keyWhiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.7,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.discount,
                    size: 17,
                    color: keyGreenColor,
                  ),
                  Text(
                    "More Savings Using Promos",
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                    color: keyGreenColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: keyWhiteColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Harga (${myCardList.length} Item)",
                        style: blackTextStyle,
                      ),
                      Text(
                        "${format.currencySymbol}$sum",
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Dikon Barang 30%",
                        style: blackTextStyle,
                      ),
                      Text(
                        "-${format.currencySymbol}${f.format(diskon)}",
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 15),
                    height: 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Harga",
                        style: blackTextStyle,
                      ),
                      Text(
                        "${format.currencySymbol}${f.format(total)}",
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Checkout Now (${myCardList.length})",
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
