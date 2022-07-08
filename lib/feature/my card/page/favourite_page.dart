import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/my%20card/widget/my_card.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: keyGreenColor,
              height: MediaQuery.of(context).size.height * 0.158,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 24,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.notifications,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 8,
                      bottom: 10,
                    ),
                    child: Text(
                      "My Card",
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: extraBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: myCardList.map(
                        (e) {
                          return MyCard(
                            image: e.image,
                            title: e.title,
                            type: e.type,
                            price: e.price,
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
