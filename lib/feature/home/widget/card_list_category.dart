import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/category_model.dart';
import 'package:grocery_mobile_app/feature/detitle/detitle_cart.dart';

import 'package:intl/intl.dart';

class CardListCategory extends StatelessWidget {
  final CategoryModel vegetableModel;
  const CardListCategory({Key? key, required this.vegetableModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5) - 24 - 10,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetitleCard(
                    vegetableModel: vegetableModel,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
                bottom: 15,
              ),
              child: Column(
                children: [
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          vegetableModel.image,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      vegetableModel.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${vegetableModel.width}mm",
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      Text(
                        "4.5",
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${format.currencySymbol} ${vegetableModel.price}",
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
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
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
                        bottom: MediaQuery.of(context).size.height * 0.77,
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
                              "Successfully added item to cart",
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 7,
                  right: 7,
                ),
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                  color: keyGreenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: keyWhiteColor,
                    size: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
