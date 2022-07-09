import 'package:flutter_bloc/flutter_bloc.dart';

class CountCard extends Cubit<int> {
  CountCard() : super(0);
  void setPage(int newPage) {
    emit(newPage);
  }
}
