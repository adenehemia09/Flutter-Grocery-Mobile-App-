import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/home/controller/grid_cubit.dart';
import 'package:grocery_mobile_app/feature/home/page/home_page.dart';
import 'package:grocery_mobile_app/feature/main/controller/page_cubit.dart';
import 'package:grocery_mobile_app/feature/my%20card/page/favourite_page.dart';
import 'package:grocery_mobile_app/feature/notification/page/notification_page.dart';
import 'package:grocery_mobile_app/feature/user/page/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildBody(
      int index,
    ) {
      switch (index) {
        case 0:
          return const HomePage();

        case 1:
          return const FavouritePage();

        case 2:
          return const NotificationPage();
        case 3:
          return const ProfilePage();

        default:
          return const HomePage();
      }
    }

    Widget buttonNavigationBarItem(
      String title,
      int index,
      String imageURL,
      IconData icon,
    ) {
      return GestureDetector(
        onTap: () {
          context.read<PageCubit>().setPage(index);
          if (index == 0) {
            context.read<GridCubit>().setPage(0);
          }
        },
        child: SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Icon(
                icon,
                color: context.watch<PageCubit>().state == index
                    ? keyGreenColor
                    : keyGrayColor,
              ),
              context.read<PageCubit>().state == index
                  ? Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontWeight: context.read<PageCubit>().state == index
                            ? bold
                            : regular,
                        fontSize: 11,
                        color: keyGreenColor,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    Widget bottomNavigationBar() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttonNavigationBarItem(
              "Home",
              0,
              "https://firebasestorage.googleapis.com/v0/b/start-up-it-pmw.appspot.com/o/Home.png?alt=media&token=44bc7a73-0142-4adf-b2eb-546fab4149d3",
              Icons.home),
          buttonNavigationBarItem(
              "My Card",
              1,
              "https://firebasestorage.googleapis.com/v0/b/start-up-it-pmw.appspot.com/o/Video%20Playlist.png?alt=media&token=671c47bb-dba4-4276-8383-2821ffdee217",
              Icons.favorite),
          buttonNavigationBarItem(
            "Notifications",
            2,
            "https://firebasestorage.googleapis.com/v0/b/start-up-it-pmw.appspot.com/o/Shopping%20Cart.png?alt=media&token=3e2cf0f6-79e4-44c4-9e28-88f204450797",
            Icons.notifications,
          ),
          buttonNavigationBarItem(
            "Profile",
            3,
            "https://firebasestorage.googleapis.com/v0/b/start-up-it-pmw.appspot.com/o/User.png?alt=media&token=494eeaa2-17b3-4f02-85dd-28abe004e3de",
            Icons.people_sharp,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: keyWhiteColor,
      body: BlocBuilder<PageCubit, int>(
        builder: (context, index) {
          return buildBody(index);
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
