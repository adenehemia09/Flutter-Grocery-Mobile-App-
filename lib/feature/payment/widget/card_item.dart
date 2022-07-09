import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';

class CardItems extends StatelessWidget {
  final MyCardModel myCardModel;
  const CardItems({Key? key, required this.myCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: keyWhiteColor,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 70,
                // color: Colors.red,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      myCardModel.image,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myCardModel.title,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 13,
                ),
              ),
              Text(
                myCardModel.price.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
