import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/home/controller/grid_cubit.dart';
import 'package:grocery_mobile_app/feature/home/widget/bread_grid.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_ads.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_categories.dart';
import 'package:grocery_mobile_app/feature/home/widget/fish_grid.dart';
import 'package:grocery_mobile_app/feature/home/widget/fruits_grid.dart';
import 'package:grocery_mobile_app/feature/home/widget/search.dart';
import 'package:grocery_mobile_app/feature/home/widget/vegetables_grid.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildGridViewList(index) {
      switch (index) {
        case 0:
          return const FruitsGrid();

        case 1:
          return const VegetablesGrid();
        case 2:
          return const FishGrid();
        case 3:
          return const BreadGrid();
        default:
          return const VegetablesGrid();
      }
    }

    Widget appBar() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 24,
          right: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/girl-coding.jpg?alt=media&token=b3dadcff-2f03-42e1-8692-76b808d5d0ac",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,",
                      style: grayTextStyle.copyWith(height: 0.5),
                    ),
                    Text(
                      "Ade Nehemia",
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () => context.read<PageCubit>().setPage(2),
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
            )
          ],
        ),
      );
    }

    Widget search() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 25,
        ),
        child: Row(
          children: [
            const Expanded(
              child: SearchBar(),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                color: keyGreenColor,
              ),
              child: Center(
                child: Icon(
                  Icons.filter_list,
                  color: keyWhiteColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget title() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 24,
        ),
        child: Text(
          "Categories",
          style: blackTextStyle.copyWith(
            fontSize: 19,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget menuBar() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(
            top: 17,
            left: 24,
          ),
          child: Row(
            children: [
              CardCategories(
                title: 'Fruits',
                indext: 0,
                image:
                    'https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fbanana__1_-removebg-preview.png?alt=media&token=9d8da3cd-2b1f-47d5-9441-1ac86895104f',
                color: keyWhiteColor,
                tColor: keyBlackColor,
              ),
              CardCategories(
                title: 'Vegetables',
                indext: 1,
                image:
                    "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Picsart_22-07-05_12-48-25-668.png?alt=media&token=0a5841a5-7c4b-4bdd-b91a-fb5f7feef3ba",
                color: keyGreenColor,
                tColor: keyWhiteColor,
              ),
              CardCategories(
                title: 'Fish',
                indext: 2,
                image:
                    'https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fish%2Fslice-raw-salmon-removebg-preview.png?alt=media&token=dd23b757-6c7b-4ef8-a30f-e497e2b5d2a9',
                color: keyWhiteColor,
                tColor: keyBlackColor,
              ),
              CardCategories(
                title: 'Bread',
                indext: 3,
                image:
                    'https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Bread%2Fhomemade-crunchy-bread-with-grains-removebg-preview.png?alt=media&token=ddf82c49-e496-4097-8a09-7aa5ff94150d',
                color: keyWhiteColor,
                tColor: keyBlackColor,
              ),
            ],
          ),
        ),
      );
    }

    Widget ads() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 24,
          ),
          child: Row(
            children: const [
              CardADS(
                color: Color(
                  0xffE2F4E9,
                ),
              ),
              CardADS(
                color: Color(
                  0xffFEEFDB,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bacgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              search(),
              title(),
              menuBar(),
              ads(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  bottom: 17,
                ),
                child: Text(
                  "Popular",
                  style: blackTextStyle.copyWith(
                    fontSize: 19,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              BlocBuilder<GridCubit, int>(
                builder: (context, index) {
                  return buildGridViewList(index);
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
