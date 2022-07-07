import 'package:flutter/material.dart';

class GridFile extends StatelessWidget {
  const GridFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          // [
          //   CardListCategory(),
          //   CardListCategory(),
          //   CardListCategory(),
          //   CardListCategory(),
          // ],
        ),
      ),
    );
  }
}
