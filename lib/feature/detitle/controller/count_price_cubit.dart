import 'package:flutter_bloc/flutter_bloc.dart';

class CountPriceCubit extends Cubit<double> {
  CountPriceCubit() : super(0);
  void setPage(double newPage) {
    emit(newPage);
  }
}
