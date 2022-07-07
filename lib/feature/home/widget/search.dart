import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      // margin: const EdgeInsets.only(
      //   top: 121,
      //   left: 24,
      //   right: 24,
      // ),
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: borderColor,
        // ),
        color: keyWhiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: TextFormField(
          // controller: controller,
          cursorColor: keyBlackColor,
          obscureText: false,
          decoration: InputDecoration(
              filled: true,
              hintText: 'Search...',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              fillColor: keyTransparentColor,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: keyTransparentColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: keyTransparentColor),
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: Color(0xff5D5D5D),
              )),
        ),
      ),
    );
  }
}
