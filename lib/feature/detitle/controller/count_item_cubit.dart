import 'package:flutter_bloc/flutter_bloc.dart';

class CountItemCubit extends Cubit<int> {
  CountItemCubit() : super(1);
  void setPage(int newPage) {
    emit(newPage);
  }
}
