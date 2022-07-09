import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';

class DataAnddress extends StatelessWidget {
  const DataAnddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: keyWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recipient address.",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Ade Nehemia Setiawan",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Bandung Indonesia",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "+62 856 7783 8245",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: keyGreenColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Ganti Alamat",
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 0.5,
                      color: keyGrayColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Kirim ke yang lain",
                      style: grayTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
