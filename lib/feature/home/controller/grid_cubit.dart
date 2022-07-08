import 'package:flutter_bloc/flutter_bloc.dart';

class GridCubit extends Cubit<int> {
  GridCubit() : super(0);
  void setPage(int newPage) {
    emit(newPage);
  }
}
