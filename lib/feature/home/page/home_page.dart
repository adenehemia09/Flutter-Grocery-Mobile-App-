import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_ads.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_categories.dart';
import 'package:grocery_mobile_app/feature/home/widget/card_list_category.dart';
import 'package:grocery_mobile_app/feature/home/widget/search.dart';
import 'package:grocery_mobile_app/model/vegetable_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Padding(
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
                        // Profile
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/girl-coding.jpg?alt=media&token=b3dadcff-2f03-42e1-8692-76b808d5d0ac",
                              ),
                            ),
                            shape: BoxShape.circle,
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
                    Container(
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
                    )
                  ],
                ),
              ),

              // Shereche
              Padding(
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
                        borderRadius: BorderRadius.circular(25),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Text(
                  "Categories",
                  style: blackTextStyle.copyWith(
                    fontSize: 19,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 17,
                    left: 24,
                  ),
                  child: Row(
                    children: [
                      CardCategories(
                        title: 'Vegetables',
                        status: 1,
                        image:
                            "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Picsart_22-07-05_12-48-25-668.png?alt=media&token=0a5841a5-7c4b-4bdd-b91a-fb5f7feef3ba",
                        color: keyGreenColor,
                        tColor: keyWhiteColor,
                      ),
                      CardCategories(
                        title: 'Fruits',
                        status: 0,
                        image: '',
                        color: keyWhiteColor,
                        tColor: keyBlackColor,
                      ),
                      CardCategories(
                        title: 'Fish',
                        status: 2,
                        image: '',
                        color: keyWhiteColor,
                        tColor: keyBlackColor,
                      ),
                      CardCategories(
                        title: 'Bread',
                        status: 3,
                        image: '',
                        color: keyWhiteColor,
                        tColor: keyBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
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
              ),
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

              GridView.count(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                crossAxisCount: 2,
                //Horizontal
                crossAxisSpacing: 24,
                //vertikal
                mainAxisSpacing: 17,
                childAspectRatio:
                    ((MediaQuery.of(context).size.width * 0.5) - 24 - 10) / 175,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: vegetableModelList.map(
                  (e) {
                    return CardListCategory(
                      vegetableModel: e,
                    );
                  },
                ).toList(),
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
