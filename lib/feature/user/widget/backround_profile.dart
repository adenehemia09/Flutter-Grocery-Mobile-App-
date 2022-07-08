import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class BackroundProfile extends StatelessWidget {
  const BackroundProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: keyGreenColor,
      ),
    );
  }
}
