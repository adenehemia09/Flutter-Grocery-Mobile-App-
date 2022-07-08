import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/category_model.dart';
import 'package:grocery_mobile_app/feature/main/page/main_page.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:intl/intl.dart';

class DetitleCard extends StatelessWidget {
  final CategoryModel vegetableModel;
  const DetitleCard({Key? key, required this.vegetableModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');

    Widget background() {
      return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/bacround.png",
            ),
          ),
        ),
      );
    }

    Widget buttomAppBar() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ));
                    context.read<PageCubit>().setPage(2);
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
          Image(
            height: 250,
            width: 300,
            image: NetworkImage(
              vegetableModel.image,
            ),
          )
        ],
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vegetableModel.title,
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "${format.currencySymbol} ${vegetableModel.price}",
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Rating
                Row(
                  children: const [
                    Icon(
                      Icons.star_rate,
                      size: 20,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 20,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 20,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 20,
                      color: Colors.orange,
                    ),
                  ],
                ),
                // count
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xffE2F4E9,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: keyGreenColor,
                          size: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "1Kg",
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: keyGreenColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: keyWhiteColor,
                          size: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Description",
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Reviews",
                  style: grayTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet dolor tellus nibh euismod viverra lectus et. Risus suspendisse dolor risus eu ultrices placerat. Massa dolor eget eu donec. Lobortis molestie pharetra sed massa cursus eu. Sem sem cras nulla turpis euismod netus. In aliquet diam eu urna aliquam non tellus.",
              style: grayTextStyle,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: keyGreenColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Add to Card",
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                background(),
                buttomAppBar(),
              ],
            ),
            content(),
          ],
        ),
      ),
    );
  }
}
