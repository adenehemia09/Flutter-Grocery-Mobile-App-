import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/home/controller/grid_cubit.dart';

class CardADS extends StatelessWidget {
  final Color color;
  const CardADS({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image(index) {
      switch (index) {
        case 0:
          return const Expanded(
            child: Image(
              image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Fcolorful-fruits-tasty-fresh-ripe-juicy-white-desk-removebg-preview.png?alt=media&token=e25c5574-7f25-4641-9aa2-7e646acab2ca",
              ),
            ),
          );
        case 1:
          return const Expanded(
            child: Image(
              image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Fbasket-full-vegetables-removebg-preview.png?alt=media&token=0ff15d74-1e5e-4a1f-adb2-f97025b021fd",
              ),
            ),
          );
        case 2:
          return const Expanded(
            child: Image(
              image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Ffresh-mackerel-steak__1_-removebg-preview.png?alt=media&token=e806f009-9471-4805-a8d7-9fe81bddca05",
              ),
            ),
          );
        case 3:
          return const Expanded(
            child: Image(
              image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Fsausages-dough-removebg-preview.png?alt=media&token=c02ca8f0-bfba-4b6d-aec4-21aa28019071",
              ),
            ),
          );

        default:
          return const Image(
            width: 94,
            image: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Fcolorful-fruits-tasty-fresh-ripe-juicy-white-desk-removebg-preview.png?alt=media&token=e25c5574-7f25-4641-9aa2-7e646acab2ca",
            ),
          );
      }
    }

    return Container(
      margin: const EdgeInsets.only(right: 20),
      // height: 150,
      width: MediaQuery.of(context).size.width * 0.77,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Up to 30% offer!",
                  style: blackTextStyle.copyWith(
                      fontWeight: extraBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enjoy our big offer of\nevery day",
                  style: grayTextStyle.copyWith(
                    fontWeight: medium,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 95,
                  decoration: BoxDecoration(
                    color: keyGreenColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: whiteTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ],
            ),
            //Imagge
            BlocBuilder<GridCubit, int>(
              builder: (context, index) {
                return image(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
