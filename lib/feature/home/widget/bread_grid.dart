import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/data/category_model.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_list_category.dart';

class BreadGrid extends StatelessWidget {
  const BreadGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      crossAxisCount: 2,
      crossAxisSpacing: 24,
      mainAxisSpacing: 17,
      childAspectRatio: ((MediaQuery.of(context).size.width * 0.5) - 34) / 175,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: breadModelList.map(
        (e) {
          return CardListCategory(
            vegetableModel: e,
          );
        },
      ).toList(),
    );
  }
}
