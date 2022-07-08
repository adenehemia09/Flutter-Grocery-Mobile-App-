import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/user/widget/backround_profile.dart';
import 'package:grocery_mobile_app/feature/user/widget/foto_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleProfile(final String title) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      );
    }

    Widget listEditAccount(
      final String title,
    ) {
      return Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: grayTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: keyGrayColor,
              size: 17,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bacgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Text(
                  "Ade Nehemia Setiawan",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: titleProfile('Account'),
            ),
            listEditAccount('Edit profile'),
            listEditAccount('Your Orders'),
            listEditAccount('Help'),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: titleProfile('General'),
            ),
            listEditAccount('Privacy & Policy'),
            listEditAccount('Term of Service'),
            listEditAccount('Rate App'),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bacgroundColor,
      appBar: AppBar(
        backgroundColor: keyGreenColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: whiteTextStyle.copyWith(
            fontSize: 17,
            fontWeight: bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  const BackroundProfile(),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 110),
                        child: content(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: const FotoProfile(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
