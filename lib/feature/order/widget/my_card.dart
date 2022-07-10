import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/data/my_card_model.dart';
import 'package:grocery_mobile_app/feature/detitle/controller/count_item_cubit.dart';
import 'package:grocery_mobile_app/feature/home/controller/grid_cubit.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:grocery_mobile_app/feature/order/controller/status_klik.dart';
import 'package:grocery_mobile_app/feature/payment/page/payment_page.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  late List data;
  late List dataPrice;

  @override
  void initState() {
    dataPrice = myCardList.map((e) => e.price).toList();
    data = myCardList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    double diskon = 0;
    double total = 0;
    var f = NumberFormat("###.0#", "en_US");

    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');

    for (var i = 0; i < data.length; i++) {
      sum += dataPrice[i];
    }
    for (var i = 0; i < data.length; i++) {
      diskon += (dataPrice[i] * 0.3);
    }

    for (var i = 0; i < data.length; i++) {
      total += (dataPrice[i] - (dataPrice[i] * 0.3));
    }

    return Column(
      children: [
        data.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 620,
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width - 160,
                    image: const NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Food_delivery_cute_man_riding_motorcycles_cartoon_art_illustration-removebg-preview.png?alt=media&token=c06e03bc-8461-49e8-8cd7-23640427220d",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You haven't placed an order yet.",
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<PageCubit>().setPage(0);
                      context.read<GridCubit>().setPage(0);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        left: 24,
                        right: 24,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: keyGreenColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Order Now",
                          style: whiteTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: data.map(
                  (e) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        width: MediaQuery.of(context).size.width - 48,
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        decoration: BoxDecoration(
                          color: keyWhiteColor,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e.image,
                                  ),
                                ),
                              ),
                            ),
                            // Keterangan
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    e.type,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${format.currencySymbol} ${f.format(e.price)}",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                        ),
                                      ),
                                      Text(
                                        "/${e.count}Kg",
                                        style: grayTextStyle.copyWith(
                                          fontWeight: medium,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var count = e.count;
                                    updateList(e.id, count + 1);
                                    setState(
                                      () {
                                        dataPrice = myCardList
                                            .map((e) => e.price)
                                            .toList();
                                      },
                                    );
                                    var price = e.price;
                                    var count2 = e.count;
                                    updatePrice(e.id, (price / count) * count2);
                                    setState(
                                      () {
                                        dataPrice = myCardList
                                            .map(
                                              (e) => e.price,
                                            )
                                            .toList();
                                      },
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
                                context.read<StatusClickCard>().state == true
                                    ? Text(
                                        "${context.watch<CountItemCubit>().state}Kg",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    : Text(
                                        "${e.count}Kg",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    var count = e.count;
                                    if (count > 1) {
                                      updateList(e.id, count - 1);
                                      setState(
                                        () {
                                          dataPrice = myCardList
                                              .map((e) => e.price)
                                              .toList();
                                        },
                                      );
                                      var price = e.price;
                                      var count2 = e.count;

                                      updatePrice(
                                          e.id, (price / count) * count2);
                                      setState(
                                        () {
                                          dataPrice = myCardList
                                              .map((e) => e.price)
                                              .toList();
                                        },
                                      );
                                    } else if (count == 1) {
                                      deleteItem(
                                        e.id,
                                      );
                                      setState(
                                        () {
                                          dataPrice = myCardList
                                              .map((e) => e.price)
                                              .toList();
                                        },
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
        const SizedBox(
          height: 20,
        ),
        dataPrice.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: keyWhiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.discount,
                              size: 17,
                              color: keyGreenColor,
                            ),
                            Text(
                              "More Savings Using Promos",
                              style: blackTextStyle.copyWith(
                                fontWeight: bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: keyGreenColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: keyWhiteColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Harga (${myCardList.length} Item)",
                                  style: blackTextStyle,
                                ),
                                Text(
                                  "${format.currencySymbol}$sum",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Dikon Barang 30%",
                                  style: blackTextStyle,
                                ),
                                Text(
                                  "-${format.currencySymbol}${f.format(diskon)}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 15),
                              height: 0.7,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Harga",
                                  style: blackTextStyle,
                                ),
                                Text(
                                  "${format.currencySymbol}${f.format(total)}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PayMentPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Checkout Now (${myCardList.length})",
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void updateList(String id, int count) {
    var index = myCardList.indexWhere((myCardList) => myCardList.id == id);
    if (index > -1) {
      setState(
        () {
          myCardList[index].count = count;
        },
      );
    }
  }

  void updatePrice(
    String id,
    double price,
  ) {
    var index = myCardList.indexWhere((myCardList) => myCardList.id == id);
    if (index > -1) {
      setState(
        () {
          myCardList[index].price = price;
        },
      );
    }
  }

  void deleteItem(
    String id,
  ) {
    var index = myCardList.indexWhere((user) => user.id == id);
    if (index > -1) {
      setState(
        () {
          myCardList.removeAt(index);
        },
      );
    }
  }
}
