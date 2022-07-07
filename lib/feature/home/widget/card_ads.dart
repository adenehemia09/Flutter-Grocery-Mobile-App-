import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class CardADS extends StatelessWidget {
  final Color color;
  const CardADS({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      // height: 150,
      width: MediaQuery.of(context).size.width * 0.77,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Up to 30% offer!",
                  style: blackTextStyle.copyWith(
                      fontWeight: extraBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enjoy our big offer of\nevery day",
                  style: grayTextStyle.copyWith(
                    fontWeight: medium,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 95,
                  decoration: BoxDecoration(
                    color: keyGreenColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: whiteTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
