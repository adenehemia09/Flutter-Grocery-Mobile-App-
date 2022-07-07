import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/favourite/widget/my_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 24, top: 20),
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8, bottom: 10),
              child: Text(
                "My Card",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: extraBold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 185,
              width: MediaQuery.of(context).size.width,

              ///color: Colors.red,
              child: ListView(
                children: const [
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
