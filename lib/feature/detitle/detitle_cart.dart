import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/category_model.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:grocery_mobile_app/feature/detitle/controller/count_item_cubit.dart';
import 'package:grocery_mobile_app/feature/detitle/controller/count_price_cubit.dart';
import 'package:grocery_mobile_app/feature/main/page/main_page.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:intl/intl.dart';

class DetitleCard extends StatefulWidget {
  final CategoryModel vegetableModel;
  const DetitleCard({Key? key, required this.vegetableModel}) : super(key: key);

  @override
  State<DetitleCard> createState() => _DetitleCardState();
}

class _DetitleCardState extends State<DetitleCard> {
  @override
  void initState() {
    context.read<CountPriceCubit>().setPage(widget.vegetableModel.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');

    Widget buttomAppBar() {
      return Container(
        color: keyGreenColor,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                context.read<CountItemCubit>().setPage(1);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: keyWhiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: keyGrayColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Text(
              "Detitle",
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
                context.read<PageCubit>().setPage(2);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: keyWhiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: keyGrayColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            color: keyWhiteColor,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image(
              height: 250,
              width: 300,
              image: NetworkImage(
                widget.vegetableModel.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.vegetableModel.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      "${format.currencySymbol} ${context.watch<CountPriceCubit>().state}",
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
                        GestureDetector(
                          onTap: () {
                            context.read<CountPriceCubit>().setPage(
                                  context.read<CountPriceCubit>().state /
                                      context.read<CountItemCubit>().state,
                                );
                            if (context.read<CountItemCubit>().state > 1) {
                              context.read<CountItemCubit>().setPage(
                                    context.read<CountItemCubit>().state - 1,
                                  );
                            }
                          },
                          child: Container(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: Text(
                            "${context.watch<CountItemCubit>().state} Kg",
                            style: blackTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CountItemCubit>().setPage(
                                  context.read<CountItemCubit>().state + 1,
                                );
                            context.read<CountPriceCubit>().setPage(
                                  context.read<CountPriceCubit>().state *
                                      context.read<CountItemCubit>().state,
                                );
                          },
                          child: Container(
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
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bacgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: keyGreenColor,
        title: buttomAppBar(),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: content(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 80,
        decoration: BoxDecoration(
          color: keyWhiteColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  try {
                    myCardList.insert(
                      0,
                      MyCardModel(
                        image: widget.vegetableModel.image,
                        title: widget.vegetableModel.title,
                        type: widget.vegetableModel.type,
                        price: widget.vegetableModel.price,
                        count: context.read<CountItemCubit>().state,
                        id: "Trans_${widget.vegetableModel.id}",
                      ),
                    );
                    statusMassege("Successfully added item to cart");
                  } catch (e) {
                    statusMassege("Failed added item to cart");
                  }
                  context.read<CountPriceCubit>().setPage(
                        context.read<CountPriceCubit>().state /
                            context.read<CountItemCubit>().state,
                      );
                  context.read<CountItemCubit>().setPage(1);
                },
                child: Container(
                  height: 50,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void statusMassege(String massege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2, microseconds: 500),
        backgroundColor: keyTransparentColor,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.65,
          ),
          padding: const EdgeInsets.all(
            14,
          ),
          decoration: BoxDecoration(
            color: const Color(
              0xffE2F4E9,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: keyGreenColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  massege,
                  style: blackTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
