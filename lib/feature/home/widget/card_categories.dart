import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class CardCategories extends StatelessWidget {
  final String title;
  final int status;
  final String image;
  final Color color;
  final Color tColor;
  const CardCategories(
      {Key? key,
      required this.title,
      required this.status,
      required this.image,
      required this.color,
      required this.tColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(45 / 2),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          image.isEmpty || (image == "")
              ? const SizedBox()
              : Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                    ),
                  ),
                ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              color: tColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
