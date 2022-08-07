import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/detitle/controller/count_item_cubit.dart';
import 'feature/detitle/controller/count_price_cubit.dart';
import 'feature/home/controller/grid_cubit.dart';
import 'feature/main/controller/page_cubit.dart';
import 'feature/notification/controller/status_notif_cubit.dart';
import 'feature/order/controller/status_klik.dart';
import 'feature/splash/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => GridCubit(),
        ),
        BlocProvider(
          create: (context) => CountItemCubit(),
        ),
        BlocProvider(
          create: (context) => CountPriceCubit(),
        ),
        BlocProvider(
          create: (context) => StatusClickCard(),
        ),
        BlocProvider(
          create: (context) => StatusNotifCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScrean(),
      ),
    );
  }
}
