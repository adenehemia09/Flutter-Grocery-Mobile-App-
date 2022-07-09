import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:grocery_mobile_app/feature/payment/widget/card_item.dart';
import 'package:grocery_mobile_app/feature/payment/widget/costtom_buttom_pay.dart';
import 'package:grocery_mobile_app/feature/payment/widget/data_anddres.dart';
import 'package:grocery_mobile_app/feature/payment/widget/shipping_detitle.dart';

class PayMentPage extends StatelessWidget {
  const PayMentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttomAppBar() {
      return Container(
        color: keyGreenColor,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: keyWhiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: keyGrayColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Text(
              "Payment",
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            const SizedBox(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bacgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: buttomAppBar(),
        elevation: 0,
        backgroundColor: keyGreenColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DataAnddress(),
              const ShippingDetitle(),
              Column(
                children: myCardList.map((e) {
                  return CardItems(
                    myCardModel: e,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CosttomButttomPay(),
    );
  }
}
