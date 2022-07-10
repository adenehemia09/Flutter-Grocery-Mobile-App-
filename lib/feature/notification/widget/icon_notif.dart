import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mobile_app/config/theme.dart';
import 'package:grocery_mobile_app/feature/notification/controller/status_notif_cubit.dart';

class IconNotif extends StatelessWidget {
  const IconNotif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        children: [
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
          ),
          context.watch<StatusNotifCubit>().state == false
              ? const SizedBox()
              : Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 11, right: 9),
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: keyGreenColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: keyWhiteColor,
                        width: 2,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
