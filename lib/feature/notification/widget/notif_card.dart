import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:intl/intl.dart';

class CardNotif extends StatelessWidget {
  final String messageType;
  final String title;
  final String message;
  final String date;
  final IconData icon;
  const CardNotif(
      {Key? key,
      required this.messageType,
      required this.title,
      required this.message,
      required this.date,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outputFormat = DateFormat('MM-dd-yyyy hh:mm a');
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.all(
        18,
      ),
      width: double.infinity,
      color: keyWhiteColor,
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                icon,
                color: keyGreenColor,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      messageType,
                      style: grayTextStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          outputFormat.format(DateTime.parse(date)),
                          style: grayTextStyle,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 7,
                          ),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: keyGreenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
